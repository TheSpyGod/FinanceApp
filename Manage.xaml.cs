using System.Collections.ObjectModel;
using System.Data;
using System.Data.Common;
using System.Reflection;
using MongoDB.Driver;
using Microsoft.Maui.Graphics.Text;
using MongoDB.Bson;
using System.Globalization;
using System.Collections.Specialized;

namespace FinanceApp;

public partial class Manage : ContentPage
{

	private static Manage _instance;
	private static readonly object _lock = new object();

	public static Manage Instance
	{
		get
		{
			lock (_lock)
			{
				if (_instance == null)
				{
					_instance = new Manage();
				}
				return _instance;
			}
		}
	}

	private DatabaseLogic logic;
	private const double ExchangeRatePLN = 0.23;
	private const double ExchangeRateEUR = 4.30;

	public static bool DataHasChanged { get; set; } = false;

	/// <summary>
	/// This class has two primary functions:
	/// a. Manipulates database entries from the connected DatabaseLogic instance.
	///    Two collections are created within DatabaseLogic: a user-modifiable one and a copy of it.
	///    It compares these collections, generates lists of items for removal and addition, and modifies the database accordingly.
	/// b. Exchanges currency based on the selected radio button.
	///    A copy of FinanceData (the user-modifiable collection) is created in DatabaseLogic.
	///    The due amount of each transaction is converted to the desired currency without altering the original collection.
	///    The converted collection is displayed in the ListView instead of the original FinanceData.
	/// </summary>
	public Manage()
	{
		InitializeComponent();
		logic = DatabaseLogic.Instance;
		this.BindingContext = logic;
	}

	private void BtnFetch_Clicked(object sender, EventArgs e)
	{
		if (BusinessType.SelectedItem != null && !string.IsNullOrEmpty(Due.Text) && !string.IsNullOrEmpty(Company.Text)) 
		{
			var lv_Company = Company.Text;
			var lv_Due = 0;

			if (int.TryParse(Due.Text, out lv_Due) && !string.IsNullOrEmpty(Due.Text));

			var lv_BusinessType = BusinessType.SelectedItem.ToString();
			var lv_Currency = Currency.SelectedItem.ToString();
			var lv_Date = DateTime.Now.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);

			logic.FinanceData.Add(new FinanceModel
			{
				due = lv_Due,
				company = lv_Company,
				businessType = lv_BusinessType,
				currency = lv_Currency,
				date = lv_Date
			});
			Lv.ItemsSource = null;
			Lv.ItemsSource = logic.FinanceData;
			Company.Text = "";
			Due.Text = "";
			DataHasChanged = true;
		}
	}
	private void BtnDelete_Clicked(object sender, EventArgs e)
	{
		if (Lv.SelectedItem is FinanceModel selection)
		{
			logic.FinanceData.Remove(selection);
			DataHasChanged = true;
		}
	}

	private async void BtnUpdate_Clicked(object sender, EventArgs e)
	{
		await logic.UpdateDatabase();
	}

	private void CurrencyExchange(string CurrencyState)
	{
		logic.CurrencyEx.Clear(); 		

		foreach (var item in logic.FinanceData)
		{
			var newModel = new FinanceModel
			{
				due = item.due,
				company = item.company,
				businessType = item.businessType,
				currency = item.currency,
				date = item.date
   	        }; 

			if (item.currency == "EUR" && CurrencyState == "PLN")
			{
				newModel.currency = "PLN";
				newModel.due = item.due * ExchangeRateEUR;
			}
			else if (item.currency == "PLN" && CurrencyState == "EUR")
			{
				newModel.currency = "EUR";
				newModel.due = item.due * ExchangeRatePLN;
			}

			logic.CurrencyEx.Add(newModel);
		}
		Lv.ItemsSource = null;
		Lv.ItemsSource = logic.CurrencyEx;
	}

	private void PLNtoEUR_CheckedChanged(object sender, CheckedChangedEventArgs e)
	{
		CurrencyExchange(PLNtoEUR.IsChecked ? "EUR" : "PLN");
	}
}