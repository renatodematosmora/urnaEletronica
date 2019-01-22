using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;

namespace P_urna_2
{
    public partial class Senador1 : Form
    {
        public Senador1()
        {
            InitializeComponent();
        }

        private void BtnConfirma_Click(object sender, EventArgs e)
        {
            Senador2 frm = new Senador2();
            Thread.Sleep(500);
            frm.ShowDialog();
            frm = null;
        }

        private void BtnCorrige_Click(object sender, EventArgs e)
        {
            TxtNumero.Text = "";
        }
    }
}
