using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace VysProje
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }


        NpgsqlConnection baglanti = new NpgsqlConnection("server=localHost;port=5432;Database=vysproje;user ID=postgres;password=123456");

        string secilen;
        
        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(comboBox1.Text=="Adres")
            {
                secilen = "adres";
                label2.Text = "adres";
                label3.Text = "adres2";
                label4.Text = "telefon";
                label5.Text = "e-posta";
                label6.Text = "posta kodu";
                label7.Text = "adres_id";
                label8.Text = "telefon 2";
                label9.Text = "";
                label10.Text = "";
                label11.Text = "";
                label12.Text = "";

            }
            if (comboBox1.Text == "Araç Modeli")
            {
                secilen = "arac_modeli";
                label2.Text = "arac adi";
                label3.Text = "arac uretim yili";
                label4.Text = "arac modeli id";
                label5.Text = "uretilen id";
                label6.Text = "arac türü";
                label7.Text = "";
                label8.Text = "";
                label9.Text = "";
                label10.Text = "";
                label11.Text = "";
                label12.Text = "";
            }
            if (comboBox1.Text == "Envanter Yonetimi")
            {
                secilen = "envanter_yonetim";
                label2.Text = "envanter \n yonetim id";
                label3.Text = "envanterdeki \n toplam  urun sayisi";
                label4.Text = "toplam siparis \n sayisi";
                label5.Text = "paket envanter id";
                label6.Text = "parca envanter id";
                label7.Text = "depo adı";
                label8.Text = "";
                label9.Text = "";
                label10.Text = "";
                label11.Text = "";
                label12.Text = "";
            }
            if (comboBox1.Text == "Fabrika")
            {
                secilen = "fabrika";
                label2.Text = "fabrika Adi";
                label3.Text = "fabrika id";
                label4.Text = "yonetim id";
                label5.Text = "adres id";
                label6.Text = "";
                label7.Text = "";
                label8.Text = "";
                label9.Text = "";
                label10.Text = "";
                label11.Text = "";
                label12.Text = "";
            }
            if (comboBox1.Text == "Musteri")
            {
                secilen = "musteri";
                label2.Text = "ad";
                label3.Text = "soyad";
                label4.Text = "musteri id";
                label5.Text = "adres id";
                label6.Text = "";
                label7.Text = "";
                label8.Text = "";
                label9.Text = "";
                label10.Text = "";
                label11.Text = "";
                label12.Text = "";
            }
            if (comboBox1.Text == "Nakliye")
            {
                secilen = "nakliye";
                label2.Text = "nakliye sekli";
                label3.Text = "adres id";
                label4.Text = "nakliye turu";
                label5.Text = "personel id";
                label6.Text = "";
                label7.Text = "";
                label8.Text = "";
                label9.Text = "";
                label10.Text = "";
                label11.Text = "";
                label12.Text = "";
            }
            if (comboBox1.Text == "Paket Özellikleri")
            {
                secilen = "paket_ozellikleri";
                label2.Text = "arac rengi";
                label3.Text = "azami hiz";
                label4.Text = "beygir gücü";
                label5.Text = "motor hacmi";
                label6.Text = "olçüleri";
                label7.Text = "paket";
                label8.Text = "şanzıman";
                label9.Text = "yakıt türü";
                label10.Text = "yakıt tüketimi";
                label11.Text = "paket ozellikleri id"; 
                label12.Text = "arac modeli id";
            }
            if (comboBox1.Text == "Parca Uretimi")
            {
                secilen = "parca_uretimi";
                label2.Text = "parca";
                label3.Text = "arac model id";
                label4.Text = "parca id";
                label5.Text = "";
                label6.Text = "";
                label7.Text = "";
                label8.Text = "";
                label9.Text = "";
                label10.Text = "";
                label11.Text = "";
                label12.Text = "";
            }
            if (comboBox1.Text == "Personel")
            {
                secilen = "personel";
                label2.Text = "calistigi bolum";
                label3.Text = "ad";
                label4.Text = "soyad";
                label5.Text = "adres id";
                label6.Text = "personel id";
                label7.Text = "prim ücreti";
                label8.Text = "";
                label9.Text = "";
                label10.Text = "";
                label11.Text = "";
                label12.Text = "";
            }
            if (comboBox1.Text == "Satış Bayii")
            {
                secilen = "satis_bayii";
                label2.Text = "bayii adi";
                label3.Text = "envanter yonetim id";
                label4.Text = "adres id";
                label5.Text = "";
                label6.Text = "";
                label7.Text = "";
                label8.Text = "";
                label9.Text = "";
                label10.Text = "";
                label11.Text = "";
                label12.Text = "";
            }
            if (comboBox1.Text == "Servis Bayii")
            {
                secilen = "servis_bayii";
                label2.Text = "servis adi";
                label3.Text = "adres adi";
                label4.Text = "envanter yonetim id";
                label5.Text = "";
                label6.Text = "";
                label7.Text = "";
                label8.Text = "";
                label9.Text = "";
                label10.Text = "";
                label11.Text = "";
                label12.Text = "";
            }
            if (comboBox1.Text == "Sipariş")
            {
                secilen = "siparis";
                label2.Text = "teslim tarihi";
                label3.Text = "teslim turu";
                label4.Text = "odeme sekli";
                label5.Text = "musteri id";
                label6.Text = "adres id";
                label7.Text = "siparis id";
                label8.Text = "alınan urun";
                label9.Text = "ucret";
                label10.Text = "personel id";
                label11.Text = "uretim maliyeti";
                label12.Text = "";
            }
            if (comboBox1.Text == "Uretilen")
            {
                secilen = "uretilen";
                label2.Text = "uretim tarihi";
                label3.Text = "ucretim suresi";
                label4.Text = "uretim maliyeti";
                label5.Text = "muretilen id ";
                label6.Text = "fabrika id";
                label7.Text = "";
                label8.Text = "";
                label9.Text = "";
                label10.Text = "";
                label11.Text = "";
                label12.Text = "";
            }
            if (comboBox1.Text == "Paket Envanteri")
            {
                secilen = "paket_envanteri";
                label3.Text = "paket adedi";
                label4.Text = "paket envanteri id";
                label5.Text = "parca id";
                label6.Text = "";
                label7.Text = "";
                label8.Text = "";
                label9.Text = "";
                label10.Text = "";
                label11.Text = "";
                label12.Text = "";
            }
            if (comboBox1.Text == "Parca Envanteri")
            {
                secilen = "parca_envanteri";
                label3.Text = "parca envanter id";
                label4.Text = "parca adedi";
                label5.Text = "parca id";
                label6.Text = "";
                label7.Text = "";
                label8.Text = "";
                label9.Text = "";
                label10.Text = "";
                label11.Text = "";
                label12.Text = "";
            }

        }


        private void button1_Click(object sender, EventArgs e)
        {
                string sorgu = "select * from "+secilen;
                NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, baglanti);
                DataSet ds = new DataSet();
                da.Fill(ds);
                dataGridView1.DataSource = ds.Tables[0];
            }

        private void button2_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            if (comboBox1.Text == "Adres")
            {
                NpgsqlCommand ekle = new NpgsqlCommand("insert into " + secilen + "(adres,adres2,telefon,e_posta,posta_kodu,adres_id,telefon_2) values (@p1,@p2,@p3,@p4,@p5,@p6,@p7)", baglanti);
                ekle.Parameters.AddWithValue("@p1", textBox1.Text);
                ekle.Parameters.AddWithValue("@p2", textBox2.Text);
                ekle.Parameters.AddWithValue("@p3", textBox3.Text);
                ekle.Parameters.AddWithValue("@p4", textBox4.Text);
                ekle.Parameters.AddWithValue("@p5", textBox5.Text);
                ekle.Parameters.AddWithValue("@p6", int.Parse(textBox6.Text));
                ekle.Parameters.AddWithValue("@p7", textBox7.Text);
                ekle.ExecuteNonQuery();
                
                MessageBox.Show("Ekleme basari ile gerceklesti");

            }
            if (comboBox1.Text == "Paket Özellikleri")
            {
                NpgsqlCommand ekle = new NpgsqlCommand("insert into " + secilen + "(arac_rengi,azami_hiz,beygir_gucu,motor_hacmi,olculeri,paket,sanziman,yakit_turu,yakit_tuketimi,paket_ozellikleri_id,arac_modeli_id) values (@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9,@p10,@p11)", baglanti);
                ekle.Parameters.AddWithValue("@p1", textBox1.Text);
                ekle.Parameters.AddWithValue("@p2", textBox2.Text);
                ekle.Parameters.AddWithValue("@p3", int.Parse(textBox3.Text));
                ekle.Parameters.AddWithValue("@p4", int.Parse(textBox4.Text));
                ekle.Parameters.AddWithValue("@p5", textBox5.Text);
                ekle.Parameters.AddWithValue("@p6", textBox6.Text);
                ekle.Parameters.AddWithValue("@p7", textBox7.Text);
                ekle.Parameters.AddWithValue("@p8", textBox8.Text);
                ekle.Parameters.AddWithValue("@p9", int.Parse(textBox9.Text));
                ekle.Parameters.AddWithValue("@p10", int.Parse(textBox10.Text));
                ekle.Parameters.AddWithValue("@p11", int.Parse(textBox11.Text));
                ekle.ExecuteNonQuery();

                MessageBox.Show("Ekleme basari ile gerceklesti");

            }
            if (comboBox1.Text == "Sipariş")
            {
                NpgsqlCommand ekle = new NpgsqlCommand("insert into " + secilen + "(teslim_tarihi,teslim_turu,odeme_sekli,musteri_id,adres_id,siparis_id,alinan_urun,ucret,personel_id,uretim_maliyeti) values (@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9,@p10)", baglanti);
                ekle.Parameters.AddWithValue("@p1", textBox1.Text);
                ekle.Parameters.AddWithValue("@p2", textBox2.Text);
                ekle.Parameters.AddWithValue("@p3", textBox3.Text);
                ekle.Parameters.AddWithValue("@p4", int.Parse(textBox4.Text));
                ekle.Parameters.AddWithValue("@p5", int.Parse(textBox5.Text));
                ekle.Parameters.AddWithValue("@p6", int.Parse(textBox6.Text));
                ekle.Parameters.AddWithValue("@p7", textBox7.Text);
                ekle.Parameters.AddWithValue("@p8", int.Parse(textBox8.Text));
                ekle.Parameters.AddWithValue("@p9", int.Parse(textBox9.Text));
                ekle.Parameters.AddWithValue("@p10", int.Parse(textBox10.Text));
                ekle.ExecuteNonQuery();

                MessageBox.Show("Ekleme basari ile gerceklesti");

            }
            baglanti.Close();

        }

        private void button3_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            if (comboBox1.Text == "Adres")
            {
                NpgsqlCommand sil = new NpgsqlCommand("Delete From adres where adres_id=@p1", baglanti);
                sil.Parameters.AddWithValue("@p1", int.Parse(textBox6.Text));
                sil.ExecuteNonQuery();
                MessageBox.Show("Silme basari ile gerceklesti");
            }
            if (comboBox1.Text == "Araç Modeli")
            {
                NpgsqlCommand sil = new NpgsqlCommand("Delete From arac_modeli where arac_modeli_id=@p1", baglanti);
                sil.Parameters.AddWithValue("@p1", int.Parse(textBox6.Text));
                sil.ExecuteNonQuery();
                MessageBox.Show("Silme basari ile gerceklesti");
            }
            if (comboBox1.Text == "Fabrika")
            {
                NpgsqlCommand sil = new NpgsqlCommand("Delete From fabrika where fabrika_id=@p1", baglanti);
                sil.Parameters.AddWithValue("@p1", int.Parse(textBox6.Text));
                sil.ExecuteNonQuery();
                MessageBox.Show("Silme basari ile gerceklesti");
            }
            if (comboBox1.Text == "Paket Özellikleri")
            {
                NpgsqlCommand sil = new NpgsqlCommand("Delete From paket_ozellikleri where paket_ozellikleri_id=@p1", baglanti);
                sil.Parameters.AddWithValue("@p1", int.Parse(textBox10.Text));
                sil.ExecuteNonQuery();
                MessageBox.Show("Silme basari ile gerceklesti");
            }
            baglanti.Close();

        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (comboBox1.Text == "Adres")
            {
                baglanti.Open();
                NpgsqlCommand guncelle = new NpgsqlCommand("update adres set adres=@p1,adres2=@p2,telefon=@p3,e_posta=@p4,posta_kodu=@p5,telefon_2=@p6 where adres_id=@p7", baglanti);
                guncelle.Parameters.AddWithValue("@p1", textBox1.Text);
                guncelle.Parameters.AddWithValue("@p2", textBox2.Text);
                guncelle.Parameters.AddWithValue("@p3", textBox3.Text);
                guncelle.Parameters.AddWithValue("@p4", textBox4.Text);
                guncelle.Parameters.AddWithValue("@p5", textBox5.Text);
                guncelle.Parameters.AddWithValue("@p7", int.Parse(textBox6.Text));
                guncelle.Parameters.AddWithValue("@p6", textBox7.Text);
                guncelle.ExecuteNonQuery();
                MessageBox.Show("Güncelleme basari ile gerceklesti");
                baglanti.Close();
            }
            if (comboBox1.Text == "Paket Özellikleri")
            {
                baglanti.Open();
                NpgsqlCommand guncelle = new NpgsqlCommand("update paket_ozellikleri set arac_rengi=@p1,azami_hiz=@p2,beygir_gucu=@p3,motor_hacmi=@p4,olculeri=@p5,paket=@p6,sanziman=@p7,yakit_turu=@p8,yakit_tuketimi=@p9,arac_modeli_id=@p10 where paket_ozellikleri_id=@p11", baglanti);
                guncelle.Parameters.AddWithValue("@p1", textBox1.Text);
                guncelle.Parameters.AddWithValue("@p2", textBox2.Text);
                guncelle.Parameters.AddWithValue("@p3", int.Parse(textBox3.Text));
                guncelle.Parameters.AddWithValue("@p4", int.Parse(textBox4.Text));
                guncelle.Parameters.AddWithValue("@p5", textBox5.Text);
                guncelle.Parameters.AddWithValue("@p6", textBox6.Text);
                guncelle.Parameters.AddWithValue("@p7", textBox7.Text);
                guncelle.Parameters.AddWithValue("@p8", textBox8.Text);
                guncelle.Parameters.AddWithValue("@p9", int.Parse(textBox9.Text));
                guncelle.Parameters.AddWithValue("@p10", int.Parse(textBox11.Text));
                guncelle.Parameters.AddWithValue("@p11", int.Parse(textBox10.Text));
                guncelle.ExecuteNonQuery();
                MessageBox.Show("Güncelleme basari ile gerceklesti");
                baglanti.Close();
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
