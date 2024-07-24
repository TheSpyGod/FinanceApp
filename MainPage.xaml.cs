using System.Collections.ObjectModel;
using Microcharts;
using SkiaSharp;
using System.Linq;
using System;
using System.Collections.Specialized;

namespace FinanceApp
{
	public partial class MainPage : ContentPage
	{
		private DatabaseLogic logic;
		private Manage manage;
		private List<ChartEntry> IncomeEntries = new List<ChartEntry>();
		private List<ChartEntry> ExpenseEntries = new List<ChartEntry>();
		private ObservableCollection<FinanceModel> SummationOfIncome { get; set; } = new ObservableCollection<FinanceModel>();
		private ObservableCollection<FinanceModel> SummationOfExpense { get; set; } = new ObservableCollection<FinanceModel>();
        private const double ExchangeRatePLN = 0.23;
        private const double ExchangeRateEUR = 4.30;
        public static class RandomHelper
		{
			private static readonly Random random = new Random();
			private static readonly object randomLock = new object();

			public static int GetRandomNumber(int minValue, int maxValue)
			{
				lock (randomLock)
				{
					return random.Next(minValue, maxValue);
				}
			}
		}
		public MainPage()
		{
			InitializeComponent();
			InitializeApp().ConfigureAwait(false);
		}
		private async Task InitializeApp()
		{
			logic = await DatabaseLogic.GetInstanceAsync();
			manage = Manage.Instance;
			await UpdateGraphs();
		}
		protected override async void OnAppearing()
		{
			base.OnAppearing();
            if (Manage.DataHasChanged)
			{
				await UpdateGraphs();
				Manage.DataHasChanged = false;
			}
		}
		private SKColor GetRandomColor()
		{
			byte r = (byte)RandomHelper.GetRandomNumber(0, 256);
			byte g = (byte)RandomHelper.GetRandomNumber(0, 256);
			byte b = (byte)RandomHelper.GetRandomNumber(0, 256);
			return new SKColor(r, g, b);
		}

		private async Task SumOfDueIncome(ObservableCollection<FinanceModel> collection)
		{
			var groupedData = logic.FinanceData
					.Where(item => item.businessType == "Income")
					.GroupBy(item => item.company)
					.Select(group => new FinanceModel
					{
						company = group.Key,
						due = group.Sum(item => item.currency == "EUR" ? item.due * ExchangeRateEUR : item.due),
					});
			await MainThread.InvokeOnMainThreadAsync(() =>
			{
				collection.Clear();
				foreach (var item in groupedData)
				{
					collection.Add(item);
				}
			});
		}

		private async Task SumOfDueExpense(ObservableCollection<FinanceModel> collection)
		{
				var groupedData = logic.FinanceData
					.Where(item => item.businessType == "Expense")
					.GroupBy(item => item.company)
					.Select(group => new FinanceModel
					{
						company = group.Key,
						due = group.Sum(item => item.currency == "EUR" ? item.due * ExchangeRateEUR : item.due),
					});
			await MainThread.InvokeOnMainThreadAsync(() =>
			{
				collection.Clear();
				foreach (var item in groupedData)
				{
					collection.Add(item);
				}
			});
		}
		private void ConvertToEntries(ObservableCollection<FinanceModel> collection, List<ChartEntry> entries)
		{
			entries.Clear();
			foreach (var item in collection)
			{
				{
					entries.Add(new ChartEntry((float)item.due)
					{
						Label = item.company,
						ValueLabel = item.due.ToString(),
						Color = GetRandomColor(),
					});
				}
			}
		}
		public async Task UpdateGraphs()
		{
			await SumOfDueIncome(SummationOfIncome);
			ConvertToEntries(SummationOfIncome, IncomeEntries);
			await SumOfDueExpense(SummationOfExpense);
			ConvertToEntries(SummationOfExpense, ExpenseEntries);

			await MainThread.InvokeOnMainThreadAsync(() =>
			{
				chartViewDonut.Chart = new DonutChart
				{
					IsAnimated = true,
					AnimationDuration = TimeSpan.FromSeconds(2),
					Entries = IncomeEntries
				};

				chartViewLine.Chart = new LineChart
				{
					IsAnimated = true,
					AnimationDuration = TimeSpan.FromSeconds(2),
					Entries = IncomeEntries
				};

				chartViewDonutExpense.Chart = new DonutChart
				{
					IsAnimated = true,
					AnimationDuration = TimeSpan.FromSeconds(2),
					Entries = ExpenseEntries
				};
				chartViewLineExpense.Chart = new LineChart
				{
					IsAnimated = true,
					AnimationDuration= TimeSpan.FromSeconds(2),
					Entries = ExpenseEntries
				};
			});
		}
	}
}
