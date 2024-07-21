using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace FinanceApp
{
	public class FinanceModel : IFinanceData
	{
		[BsonId]
		public ObjectId Id { get; set; }
		public string company { get; set; }
		public double due { get; set; }
		public string businessType { get; set; }
		public string currency {  get; set; }
		public string date { get; set; }
	}
}
