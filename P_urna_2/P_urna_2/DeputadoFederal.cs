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
using Repositorio;

namespace P_urna_2
{
    public partial class DeputadoFederal : Form
    {
        public DeputadoFederal()
        {
            InitializeComponent();
        }

        private void BtnConfirma_Click(object sender, EventArgs e)
        {
            DeputadoEstadual frm = new DeputadoEstadual();
            ChamarSom();
            Thread.Sleep(500);
            frm.ShowDialog();
            this.Close();
            frm = null;


        }

        private void BtnCorrige_Click(object sender, EventArgs e)
        {
            TxtNumero.Text = "";
        }

        private void BtnBranco_Click(object sender, EventArgs e)
        {

        }

        private void ChamarSom(){
            System.Media.SoundPlayer player = new System.Media.SoundPlayer();
            player.SoundLocation = "C:/Users/Renat/Documents/Documentos-Renato/Banco de Dados II/Aula12/P_urna_2/confirma.wav";
            player.Load();
            player.PlaySync();

        }

        private void TxtNumero_Leave(object sender, EventArgs e)
        {
            candidato cand = (new CandidatosRepositorio()).selecionar(TxtNumero.Text);
            if (cand.numeroeleitoral_candidato == TxtNumero.Text){
                label_nomeCand.Text = cand.nome_candidato;

            }
        }

        private void visor_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
