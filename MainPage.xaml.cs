using System.Collections.ObjectModel;
using Microcharts;
using SkiaSharp;
using System.Linq;
using System.Collections.Specialized;

namespace FinanceApp
{
	public partial class MainPage : ContentPage
	{
		private DatabaseLogic logic;
		private bool isUpdating = false;
		private List<ChartEntry> entries;
		public ObservableCollection<FinanceModel> SummationOfDue { get; private set; } = new ObservableCollection<FinanceModel>();
		private static ThreadLocal<Random> randomWrapper = new ThreadLocal<Random>(() => new Random());
		public MainPage()
		{
			InitializeComponent();
			logic = DatabaseLogic.Instance;
			InitializeAsync();
		}
		protected override async void OnAppearing()
		{
			base.OnAppearing();
			UpdateGraphs();
		}
		private async Task InitializeAsync()
		{
			if (logic.FinanceData.Count == 0) await logic.FetchData();
		}
		private SKColor GetRandomColor()
		{
			byte[] rgb = new byte[3];
			randomWrapper.Value.NextBytes(rgb);
			return new SKColor(rgb[0], rgb[1], rgb[2]);
		}

		public void SumOfDue()
		{
			var groupedData = logic.FinanceData
					.GroupBy(item => item.company)
					.Select(group => new FinanceModel
					{
						company = group.Key,
						due = group.Sum(item => item.due),
						businessType = group.First().businessType 	
					});
			SummationOfDue.Clear();
			foreach (var item in groupedData)
			{
				SummationOfDue.Add(item);
			}
		}

		private void ConvertToEntries()
		{
			if (entries == null)
			{
				entries = new List<ChartEntry>();
			}
			else
			{
				entries.Clear();
			}
			foreach (var item in SummationOfDue)
				{
					SKColor color = GetRandomColor();
					entries.Add(new ChartEntry((float)item.due) {
						Label = item.company,
						ValueLabel = item.due.ToString(),
						Color = color,
					});
				}
		}

		public void UpdateGraphs()
		{
			if (isUpdating) return;

			isUpdating = true;
			SumOfDue();
			ConvertToEntries();

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

			isUpdating = false;
		}
	}
}
