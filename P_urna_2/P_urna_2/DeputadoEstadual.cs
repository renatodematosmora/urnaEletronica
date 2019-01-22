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
    public partial class DeputadoEstadual : Form
    {
        public DeputadoEstadual()
        {
            InitializeComponent();
        }

        private void BtnConfirma_Click(object sender, EventArgs e)
        {
            Senador1 frm = new Senador1();
            Thread.Sleep(500);
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
