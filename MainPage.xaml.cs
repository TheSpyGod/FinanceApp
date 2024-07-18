using System.Collections.ObjectModel;
using Microcharts;
using SkiaSharp;
using System.Linq;

namespace FinanceApp
{
	public partial class MainPage : ContentPage
	{
		private DatabaseLogic logic;
		private ChartEntry[] entries;
		public ObservableCollection<FinanceModel> SummationOfDue { get; private set; } = new ObservableCollection<FinanceModel>();
		private static ThreadLocal<Random> randomWrapper = new ThreadLocal<Random>(() => new Random());
		public MainPage()
		{
			InitializeComponent();
			InitializeAsync();
		
		}

		private async Task InitializeAsync()
		{
			if (logic == null) logic = new DatabaseLogic();
			if (logic.FinanceData.Count < 1) await logic.FetchData();
			if (SummationOfDue == null || SummationOfDue.Count < 1) SumOfDue();
			if (entries == null)	entries = new ChartEntry[SummationOfDue.Count];

			try
			{
				ConvertToEntries();
			
			chartViewDonut.Chart = new DonutChart
			{
				IsAnimated = true,
				Entries = entries
			};
			chartViewLine.Chart = new LineChart
			{
				IsAnimated = true,
				Entries = entries
			};
			}
			catch (Exception ex)
			{
				Console.WriteLine($"Error in ConvertToEntries: {ex.Message}");
			}

		}

		private SKColor GetRandomColor()
		{
			byte[] rgb = new byte[3];
			randomWrapper.Value.NextBytes(rgb);
			return new SKColor(rgb[0], rgb[1], rgb[2]);
		}

		private void SumOfDue()
		{
			var groupedData = logic.FinanceData
					.GroupBy(item => item.company)
					.Select(group => new FinanceModel
					{
						company = group.Key,
						due = group.Sum(item => item.due),
						businessType = group.First().businessType 	
					});

			SummationOfDue = new ObservableCollection<FinanceModel>(groupedData);
		}

		private void ConvertToEntries()
		{
				for (int i = 0; i < SummationOfDue.Count; i++)
				{
					SKColor color = GetRandomColor();
					var item = SummationOfDue[i];
					entries[i] = new ChartEntry((float)item.due) {
						Label = item.company,
						ValueLabel = item.due.ToString(),
						Color = color,
					};
				}
		}


	}
}
