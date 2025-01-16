namespace Product_Demo.DAL
{
    public class DAL_Connection
    {
        public string GetDatabaseConnection(IConfiguration configuration)
        {
            return configuration.GetConnectionString("DBConnection");
        }
    }
}
