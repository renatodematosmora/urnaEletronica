using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace P_urna_2
{
    public partial class Presidente : Form
    {
        public Presidente()
        {
            InitializeComponent();
        }

        private void BtnConfirma_Click(object sender, EventArgs e)
        {
            Form1 frm = new Form1();
            frm.ShowDialog();
            frm = null;
        }

        private void BtnCorrige_Click(object sender, EventArgs e)
        {
            TxtNumero.Text = "";
        }

        private void BtnBranco_Click(object sender, EventArgs e)
        {

        }
    }
}
