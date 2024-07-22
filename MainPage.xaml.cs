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
		private List<ChartEntry> entries;
		public ObservableCollection<FinanceModel> SummationOfIncome { get; private set; } = new ObservableCollection<FinanceModel>();
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
			logic = DatabaseLogic.Instance;
			manage = Manage.Instance;
			InitializeAsync();
			UpdateGraphs();
		}
		protected override void OnAppearing()
		{
			base.OnAppearing();
			if (Manage.DataHasChanged)
			{
				UpdateGraphs();
				Manage.DataHasChanged = false;
			}
		}

		private async Task InitializeAsync()
		{
			if (logic.FinanceData.Count == 0) await logic.FetchData();
		}
		private SKColor GetRandomColor()
		{
			byte r = (byte)RandomHelper.GetRandomNumber(0, 256);		
			byte g = (byte)RandomHelper.GetRandomNumber(0, 256);
			byte b = (byte)RandomHelper.GetRandomNumber(0, 256);
			return new SKColor(r, g, b);
		}

		public async Task SumOfDue(ObservableCollection<FinanceModel> collection)
		{
			var groupedData = logic.FinanceData
					.Where(item => item.businessType == "Income")
					.GroupBy(item => item.company)
					.Select(group => new FinanceModel
					{
						company = group.Key,
						due = group.Sum(item => item.due),
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

		private void ConvertToEntries(ObservableCollection<FinanceModel> collection)
		{
			if (entries == null)
			{
				entries = new List<ChartEntry>();
			}
			else
			{
				entries.Clear();
			}
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
			await SumOfDue(SummationOfIncome);
			ConvertToEntries(SummationOfIncome);

			await MainThread.InvokeOnMainThreadAsync(() =>
			{
				chartViewDonut.Chart = new DonutChart
				{
					IsAnimated = true,
					AnimationDuration = TimeSpan.FromSeconds(2),
					Entries = entries
				};

				chartViewLine.Chart = new LineChart
				{
					IsAnimated = true,
					AnimationDuration = TimeSpan.FromSeconds(2),
					Entries = entries
				};
			});
		}
	}
}
