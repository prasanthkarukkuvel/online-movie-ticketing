using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;
using System.Configuration;
using System.Net.Mail;
using System.Xml;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.IO;
using SmsClient;
namespace Rainbow
{

    public class Arena
    { }
    public class Tools : Arena
    { }
    public class Resources : Arena
    {
        public string[] showid = { "SHEV04", "SHEV09", "SHEV14", "SHEV19", "SHEV24", "SHMA02", "SHMA07", "SHMA12", "SHMA17", "SHMA22", "SHMR01", "SHMR06", "SHMR11", "SHMR16", "SHMR21", "SHNI05", "SHNI10", "SHNI15", "SHNI20", "SHNI25", "SHNO03", "SHNO08", "SHNO13", "SHNO18", "SHNO23" };
        public string[] mapday = { "movies_on_sunday", "movies_on_monday", "movies_on_tuesday", "movies_on_wednesday", "movies_on_thursday", "movies_on_friday", "movies_on_saturday" };
        public string[] row_name = { "row_a", "row_b", "row_c", "row_d", "row_e", "row_f", "row_g", "row_h", "row_i" };
        public string[] dayid = { "SUNDAY", "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY" };
        public string[] screenid = { "SCRIN01", "SCRDE02", "SCRES03", "SCRFU04", "SCRDO05" };
        public string[] showmd = { "EVENING", "MATINEE", "MORNING", "NIGHT", "NOON" };
        public string query_sum_of_row = "SUM(s1+s2+s3+s4+s5+s6+s7+s8+s9+s10+s11+s12+s13+s14+s15+s16+s17+s18+s19+s20+s21)";
        public string query_update_row = "s1=0,s2=0,s3=0,s4=0,s5=0,s6=0,s7=0,s8=0,s9=0,s10=0,s11=0,s12=0,s13=0,s14=0,s15=0,s16=0,s17=0,s18=0,s19=0,s20=0,s21=0";

    }
    public class User : Resources
    {
        public int currentID = 0;
        public string fname = "";
        public string umail = "";
        public string lname = "";
        public string upass = "";
        public string umobile = "";
        MySqlConnection sql = new MySqlConnection();

        public User()
        {

        }
        public string getFirstName(int uid)
        {
            try
            {
                sql.cpn();
                sql.com.CommandText = "select fname from udetails where uid=" + uid;
                sql.dr = sql.com.ExecuteReader();
                while (sql.dr.Read())
                    fname = sql.dr.GetString(0);
                sql.rcls();
                sql.cls();
            }
            catch { return ""; }
            return fname;
        }
        public string getLastName(int uid)
        {
            try
            {
                sql.cpn();
                sql.com.CommandText = "select lname from udetails where uid=" + uid;
                sql.dr = sql.com.ExecuteReader();
                while (sql.dr.Read())
                    lname = sql.dr.GetString(0);
                sql.rcls();
                sql.cls();
            }
            catch { return ""; }
            return lname;
        }
        public string getEmail(int uid)
        {
            try
            {
                sql.cpn();
                sql.com.CommandText = "select umail from udetails where uid=" + uid;
                sql.dr = sql.com.ExecuteReader();
                while (sql.dr.Read())
                    umail = sql.dr.GetString(0);
                sql.rcls();
                sql.cls();
            }
            catch { return ""; }
            return umail;
        }
        public string getFirstLastName(int uid)
        {
            try
            {
                sql.cpn();
                sql.com.CommandText = "select fname,lname from udetails where uid=" + uid;
                sql.dr = sql.com.ExecuteReader();
                while (sql.dr.Read())
                {
                    fname = sql.dr.GetString(0);
                    lname = sql.dr.GetString(1);
                }
                sql.rcls();
                sql.cls();
            }
            catch { return ""; }
            return fname+" "+lname;
        }

    }
    
    public class Show : Resources
    {
        public string getShowTime(string shwidq, string scridq)
        {
            string stime = "";
            MySqlConnection sql = new MySqlConnection();
            try
            {
                sql.cpn();
                sql.com.CommandText = "select shwtime from show_times where shwid='" + shwidq + "' and scrid='" + scridq + "'";
                sql.dr = sql.com.ExecuteReader();
                if (sql.dr.HasRows)
                {
                    while (sql.dr.Read())
                        stime = sql.dr.GetString(0);
                    sql.rcls();
                }
                else
                {
                    stime = "Unknown Time";
                    sql.rcls();
                }
                sql.cls();
            }
            catch
            {
                stime = "Unknown Time";
            }
            return stime;
        }
    }
    public class Seats : Resources
    {
        public const int total_seats = 189;
        public const int seat_per_row = 21;
        public const int num_of_rows = 9;
        public string seatID = "";
        public char[] rname = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I' };
        public int getAvailSeat()
        {
            return 0;
        }
        public bool isSeatAvail(string seat)
        {
            return false;
        }
        public void setSeatBooked(string seat)
        { }
    }
    public class ASeats : Seats
    {

    }
    public class CryptoSystem : Tools
    {
        private static byte[] key = { };
        private static byte[] IV = { 81, 15, 206, 48, 52, 64, 20, 16 };
        private static string stringKey = "!6Ko{3a#N";
        public string encString(string text)
        {
            return _enc(text);
        }
        public string dncString(string text)
        {
            return _dnc(text);
        }
        private string _enc(string text)
        {

            key = Encoding.UTF8.GetBytes(stringKey.Substring(0, 8));
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            Byte[] byteArray = Encoding.UTF8.GetBytes(text);
            MemoryStream memoryStream = new MemoryStream();
            CryptoStream cryptoStream = new CryptoStream(memoryStream,
            des.CreateEncryptor(key, IV), CryptoStreamMode.Write);
            cryptoStream.Write(byteArray, 0, byteArray.Length);
            cryptoStream.FlushFinalBlock();
            return Convert.ToBase64String(memoryStream.ToArray());

        }
        private string _dnc(string text)
        {

            key = Encoding.UTF8.GetBytes(stringKey.Substring(0, 8));
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            Byte[] byteArray = Convert.FromBase64String(text);
            MemoryStream memoryStream = new MemoryStream();
            CryptoStream cryptoStream = new CryptoStream(memoryStream,
            des.CreateDecryptor(key, IV), CryptoStreamMode.Write);
            cryptoStream.Write(byteArray, 0, byteArray.Length);
            cryptoStream.FlushFinalBlock();
            return Encoding.UTF8.GetString(memoryStream.ToArray());
        }
    }
    public class MySqlConnection : Tools
    {
        public SqlConnection con = null;
        public SqlCommand com = null;
        public SqlDataReader dr = null;
        public SqlDataAdapter adr = null;
        public MySqlConnection()
        {
            con = new SqlConnection(ConfigurationManager.ConnectionStrings["connection"].ConnectionString);
            com = new SqlCommand("", con);
            adr = new SqlDataAdapter("", con);
        }
        public void cpn()
        {
            if (con.State != System.Data.ConnectionState.Open)
                con.Open();
        }
        public void cls()
        {
            if (con.State != System.Data.ConnectionState.Closed)
                con.Close();
        }
        public void rcls()
        {
            if (!dr.IsClosed)
                dr.Close();
        }
        public SqlConnection getcon()
        { return con; }
    }

    public class GPassword : Tools
    {
        private readonly Random _rng = new Random((int)DateTime.Now.Ticks);
        private const string _chars = "ABCDEFfghiGHIJKL12345MNOPQRmnopqrstuvwxyzSTU9XYZABCabcdejklVWXYZ678";

        public string rs(int size)
        {
            char[] buffer = new char[size];

            for (int i = 0; i < size; i++)

                buffer[i] = _chars[_rng.Next(_chars.Length)];

            return new string(buffer);
        }
    }
    public class Movie : Resources
    {
        public int movid = 0;
        public string movname = "";
        public int movcat = 0;
        public string movdir = "";
        public string movdate;
        public string movdura = "";
        public string movlang = "";
        public int movtype = 0;
        public string movtrid = "";
        public HttpPostedFile movpic1 = null;
        public HttpPostedFile movpic2 = null;

        MySqlConnection sql = new MySqlConnection();
        string mname = "";
        public string getMovieName(int movid)
        {
            sql.cpn();

            sql.com.CommandText = "select mname from mdetail where mid=" + movid;
            sql.dr = sql.com.ExecuteReader();
            while (sql.dr.Read())
                mname = sql.dr.GetString(0);
            sql.rcls();
            sql.cls();
            return mname;
        }

    }
    public class Screen : Resources
    {
        MySqlConnection sql = new MySqlConnection();

        public string[] getShows(string psid)
        {
            string[] shows = new string[5];

            return shows;
        }

        public string getScreenName(string scrid)
        {
            return _getScreen(scrid);
        }

        public string getScreenName(int psid)
        {
            return _getScreen(screenid[(psid - 1)]);
        }

        private string _getScreen(string elemList)
        {
            try
            {
                sql.cpn();
                sql.com.CommandText = "select scrname from screen_info where scrid='" + elemList + "'";
                sql.dr = sql.com.ExecuteReader();
                if (sql.dr.HasRows)
                {
                    while (sql.dr.Read())
                        elemList = sql.dr.GetString(0);
                    sql.rcls();
                }
                else
                {
                    elemList = "Unknown Screen";
                    sql.rcls();
                }
                sql.cls();
            }
            catch
            {
                elemList = "Unknown Screen";
            }
            return elemList;
        }
    }

    public class MService : Tools
    {
        public bool SendMail(string body, string mailto)
        {
            try
            {
                var fromAddress = "movie.rainbow@gmail.com";
                var toAddress = mailto;
                const string fromPassword = "rainbow@123";
                string subject = "Rainbow Entertainments";

                MailMessage mail = new MailMessage();

                mail.From = new MailAddress(fromAddress);
                mail.To.Add(toAddress);
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;

                SmtpClient smtp = new SmtpClient();
                {
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                    smtp.Credentials = new System.Net.NetworkCredential(fromAddress, fromPassword);
                    smtp.Timeout = 20000;
                }

                smtp.Send(mail);
                return false;
            }
            catch 
            {
                return true;
            }
        }
    }
    public class SMSClient : Tools
    {
        public SendSms sms = new SendSms();
        public bool send(string message, string to)
        {
            string s = sms.send("9176435810", "plssendsms", message, to);
            if (s == "1")
                return true;
            else
                return false;
        }
    }
    public class UserInfo : User
    {


        public object[] _user;
        public int imovieid = 0;
        public string iscreen = "";
        public string itime = "";
        public string ishow = "";
        public string ishowid = "";
        public string irowid = "";
        public string iday = "";
        public string idate = "";
        public string tempday = "";
        public int iseat = 0;
        public void load_user()
        {
            this.imovieid = Convert.ToInt32(_user[0]);
            this.iscreen = (string)_user[1];
            this.itime = (string)_user[2];
            this.ishow = ((string)_user[3] + " show").ToLower();
            this.ishowid = (string)_user[4];
            this.irowid = (string)_user[5];
            this.tempday = (string)_user[6];
            this.iday = ((string)_user[6] + "").ToLower();
            this.idate = ((string)_user[7]).Replace("-", " ");
            this.iseat = Convert.ToInt32(_user[8]);

        }

    }
}