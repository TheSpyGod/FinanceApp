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
	public interface IFinanceData
	{
		[BsonId]
		ObjectId Id { get; set; }
		string company { get; set; }
		double due { get; set; }
		string businessType { get; set; }
		string currency {  get; set; }
		string date { get; set; }
	}
}
