using System.Collections.ObjectModel;
using System.Data;
using System.Data.Common;
using System.Reflection;
using MongoDB.Driver;
using Microsoft.Maui.Graphics.Text;
using MongoDB.Bson;

namespace FinanceApp;

public partial class Manage : ContentPage
{	
	private DatabaseLogic logic;
	private const double ExchangeRatePLN = 0.23;
	private const double ExchangeRateEUR = 4.30;
		public Manage()
	{
		InitializeComponent();
		if (logic == null) logic = new DatabaseLogic(); this.BindingContext = logic;
	}

	private void BtnFetch_Clicked(object sender, EventArgs e)
	{
		if (BusinessType.SelectedItem != null && Due.Text != "" && Company.Text != null) 
		{
			var lv_Company = Company.Text;
			var lv_Due = 0;

			if (int.TryParse(Due.Text, out lv_Due) && !string.IsNullOrEmpty(Due.Text));
			var lv_BusinessType = BusinessType.SelectedItem.ToString();
			var lv_Currency = Currency.SelectedItem.ToString();
			var lv_Date = DateTime.Now;
			logic.FinanceData.Add(new FinanceModel
			{
				due = lv_Due,
				company = lv_Company,
				businessType = lv_BusinessType,
				currency = lv_Currency,
				date = lv_Date
			});
			Lv.ItemsSource = logic.FinanceData;
			Company.Text = "";
			Due.Text = "";
		}
	}
	private void BtnDelete_Clicked(object sender, EventArgs e)
	{
		var selection = Lv.SelectedItem as FinanceModel;		
		if (selection != null)
		{
			logic.FinanceData.Remove(selection); 
			Lv.ItemsSource = null; 	
			Lv.ItemsSource = logic.FinanceData; 
		}
	}

	private async void BtnUpdate_Clicked(object sender, EventArgs e)
	{
		await logic.UpdateDatabase();
	}

	private void CurrencyExchange(string CurrencyState)
	{
		Lv.ItemsSource = logic.FinanceData;
		if (logic.CurrencyEx.Count != 0) logic.CurrencyEx.Clear(); 		
		else logic.CurrencyEx = new ObservableCollection<FinanceModel>();

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
		Lv.ItemsSource = logic.CurrencyEx;
	}

	private void PLNtoEUR_CheckedChanged(object sender, CheckedChangedEventArgs e)
	{
		if (PLNtoEUR.IsChecked == true) CurrencyExchange("EUR");
		else CurrencyExchange("PLN");
	}
}