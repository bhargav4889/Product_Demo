using Product_Demo.DAL;
using Product_Demo.Models;

namespace Product_Demo.BAL
{
    public class BAL_Auth
    {
        private readonly DAL_Auth dal_Auth;

        public BAL_Auth(IConfiguration configuration)
        {
            dal_Auth = new DAL_Auth(configuration);
        }


        public Auth_Model Auth_Login(Auth_Model auth)
        {
            Auth_Model authDetails = dal_Auth.Auth_Login(auth);

            return authDetails;
        }


    }
}
