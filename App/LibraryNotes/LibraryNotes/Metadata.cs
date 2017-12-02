using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryNotes
{

    public class Metadata
    {
        static public string CurrentConnectionString = ConnectionString.defaultString;
        static public bool CurrentAppRole;

        public class ConnectionString
        {
            static public string defaultString = "Data Source=DESKTOP-FFV5E68\\SQLEXPRESS;Initial Catalog=LibraryNotes;Integrated Security=true;";
            static public string user = "Data Source=DESKTOP-FFV5E68\\SQLEXPRESS;Integrated Security = False; User ID = userln; Password=userln;ApplicationIntent=ReadWrite;";
            static public string admin = "Data Source=DESKTOP-FFV5E68\\SQLEXPRESS;Integrated Security=False;User ID=adminln;Password=adminln;ApplicationIntent=ReadWrite;";
        }
        public enum AuthRoles
        {
            ADMIN = 2,
            USER = 1,
            ANON = 0
        }

    }
}
