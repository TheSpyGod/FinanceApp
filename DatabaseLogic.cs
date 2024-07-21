using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Text;
using System.Threading.Tasks;
using MongoDB.Driver;
using MongoDB.Bson;
using System.Collections.ObjectModel;
using System.Collections.Specialized;

namespace FinanceApp
{
	public class DatabaseLogic
	{
		private static DatabaseLogic _instance;
		private static readonly object _lock = new object();
		public static DatabaseLogic Instance
		{
			get
			{
				lock (_lock)
				{
					if (_instance == null)
					{
						_instance = new DatabaseLogic();
					}
					return _instance;
				}
			}
		}
		public ObservableCollection<FinanceModel> FinanceData { get; private set; } = new ObservableCollection<FinanceModel>();
		private ObservableCollection<FinanceModel> OriginFinance { get; set; } = new ObservableCollection<FinanceModel>();
		public ObservableCollection<FinanceModel> CurrencyEx { get; private set; } = new ObservableCollection<FinanceModel>();
		private MongoClient client;
		public IMongoCollection<FinanceModel> collection;

		public DatabaseLogic()
		{
			client = new MongoClient("mongodb://127.0.0.1:27017/");
			InitializeAsync();
		}

		private async Task InitializeAsync()
		{
			await FetchData();
		}

		public async Task FetchData()
		{
			try
			{
				var database = client.GetDatabase("FinanceApp");
				collection = database.GetCollection<FinanceModel>("Finance");

				var data = await collection.Find(_ => true).ToListAsync();

				FinanceData.Clear();
				OriginFinance.Clear();

				foreach (var item in data)
				{
					FinanceData.Add(item);
					OriginFinance.Add(item);
				}
			}
			catch (Exception ex)
			{
				Console.WriteLine($"Error fetching data: {ex.Message}");
			}
		}

		public async Task UpdateDatabase()
		{
			try
			{
				var itemsToAdd = FinanceData.Except(OriginFinance).ToList();
				var itemsToRemove = OriginFinance.Except(FinanceData).ToList();

				foreach (var item in itemsToAdd)
				{
					await collection.InsertOneAsync(item);
					OriginFinance.Add(item);
				}

				foreach (var item in itemsToRemove)
				{
					var filter = Builders<FinanceModel>.Filter.Eq("Id", item.Id);
					await collection.DeleteOneAsync(filter);
					OriginFinance.Remove(item);
				}
			}
			catch (Exception ex)
			{
				Console.WriteLine($"Error updating database: {ex.Message}");
			}
		}
	}
}
