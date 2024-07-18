using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Text;
using System.Threading.Tasks;
using MongoDB.Driver;
using MongoDB.Bson;
using System.Collections.ObjectModel;

namespace FinanceApp
{
    public class DatabaseLogic
    {
		public ObservableCollection<FinanceModel> FinanceData { get; private set; } = new ObservableCollection<FinanceModel>();
		private ObservableCollection<FinanceModel> OriginFinance { get; set; } = new ObservableCollection<FinanceModel>();
		public ObservableCollection<FinanceModel> CurrencyEx { get; set; } = new ObservableCollection<FinanceModel>();
		private MongoClient client = new MongoClient("mongodb://127.0.0.1:27017/");

		public IMongoCollection<FinanceModel> collection;

		public DatabaseLogic()
		{
			FetchData();
		}

		public async Task FetchData()
		{
			var database = client.GetDatabase("FinanceApp");
			collection = database.GetCollection<FinanceModel>("Finance");

			try
			{
				var data = await collection.Find(_ => true).ToListAsync();
				foreach (var item in data)
				{	
					if (!FinanceData.Contains(item) && !OriginFinance.Contains(item)) FinanceData.Add(item); OriginFinance.Add(item);
				}
			}
			catch (Exception ex) 
			{
				Console.Write(ex.ToString());
			}
		}

		public async Task UpdateDatabase()
		{
			foreach (var item in FinanceData)
			{	
				if (!OriginFinance.Contains(item)) await collection.InsertOneAsync(item); OriginFinance.Add(item);
			}
			foreach (var item in OriginFinance.ToList())			{
				if (!FinanceData.Contains(item))
				{
					var filter = Builders<FinanceModel>.Filter.Eq("Id", item.Id); 
					await collection.DeleteOneAsync(filter);
					OriginFinance.Remove(item);
				}
			}
		}	
	}
	
}
