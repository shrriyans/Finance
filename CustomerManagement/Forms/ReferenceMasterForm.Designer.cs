namespace CustomerManagement.Forms
{
    partial class ReferenceMasterForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lblTitle = new System.Windows.Forms.Label();
            this.lblReferenceId = new System.Windows.Forms.Label();
            this.lblName = new System.Windows.Forms.Label();
            this.lblAddress = new System.Windows.Forms.Label();
            this.lblCity = new System.Windows.Forms.Label();
            this.lblMobileNo1 = new System.Windows.Forms.Label();
            this.lblMobileNo2 = new System.Windows.Forms.Label();
            this.lblEmailId = new System.Windows.Forms.Label();
            this.lblReferenceName = new System.Windows.Forms.Label();
            this.txtReferenceId = new System.Windows.Forms.TextBox();
            this.txtName = new System.Windows.Forms.TextBox();
            this.txtAddress = new System.Windows.Forms.TextBox();
            this.txtMobileNo1 = new System.Windows.Forms.TextBox();
            this.txtMobileNo2 = new System.Windows.Forms.TextBox();
            this.txtEmailId = new System.Windows.Forms.TextBox();
            this.txtReferenceName = new System.Windows.Forms.TextBox();
            this.cmbCity = new System.Windows.Forms.ComboBox();
            this.chkIsActive = new System.Windows.Forms.CheckBox();
            this.btnSave = new System.Windows.Forms.Button();
            this.btnNew = new System.Windows.Forms.Button();
            this.btnClose = new System.Windows.Forms.Button();
            this.dgvReferences = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.dgvReferences)).BeginInit();
            this.SuspendLayout();
            // 
            // lblTitle
            // 
            this.lblTitle.AutoSize = true;
            this.lblTitle.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Bold);
            this.lblTitle.Location = new System.Drawing.Point(20, 20);
            this.lblTitle.Name = "lblTitle";
            this.lblTitle.Size = new System.Drawing.Size(173, 24);
            this.lblTitle.TabIndex = 0;
            this.lblTitle.Text = "Reference Master";
            // 
            // lblReferenceId
            // 
            this.lblReferenceId.AutoSize = true;
            this.lblReferenceId.Location = new System.Drawing.Point(20, 70);
            this.lblReferenceId.Name = "lblReferenceId";
            this.lblReferenceId.Size = new System.Drawing.Size(76, 13);
            this.lblReferenceId.TabIndex = 1;
            this.lblReferenceId.Text = "Reference ID:";
            // 
            // lblName
            // 
            this.lblName.AutoSize = true;
            this.lblName.Location = new System.Drawing.Point(20, 100);
            this.lblName.Name = "lblName";
            this.lblName.Size = new System.Drawing.Size(35, 13);
            this.lblName.TabIndex = 2;
            this.lblName.Text = "Name:";
            // 
            // lblAddress
            // 
            this.lblAddress.AutoSize = true;
            this.lblAddress.Location = new System.Drawing.Point(20, 130);
            this.lblAddress.Name = "lblAddress";
            this.lblAddress.Size = new System.Drawing.Size(48, 13);
            this.lblAddress.TabIndex = 3;
            this.lblAddress.Text = "Address:";
            // 
            // lblCity
            // 
            this.lblCity.AutoSize = true;
            this.lblCity.Location = new System.Drawing.Point(20, 160);
            this.lblCity.Name = "lblCity";
            this.lblCity.Size = new System.Drawing.Size(27, 13);
            this.lblCity.TabIndex = 4;
            this.lblCity.Text = "City:";
            // 
            // lblMobileNo1
            // 
            this.lblMobileNo1.AutoSize = true;
            this.lblMobileNo1.Location = new System.Drawing.Point(20, 190);
            this.lblMobileNo1.Name = "lblMobileNo1";
            this.lblMobileNo1.Size = new System.Drawing.Size(62, 13);
            this.lblMobileNo1.TabIndex = 5;
            this.lblMobileNo1.Text = "Mobile No1:";
            // 
            // lblMobileNo2
            // 
            this.lblMobileNo2.AutoSize = true;
            this.lblMobileNo2.Location = new System.Drawing.Point(20, 220);
            this.lblMobileNo2.Name = "lblMobileNo2";
            this.lblMobileNo2.Size = new System.Drawing.Size(62, 13);
            this.lblMobileNo2.TabIndex = 6;
            this.lblMobileNo2.Text = "Mobile No2:";
            // 
            // lblEmailId
            // 
            this.lblEmailId.AutoSize = true;
            this.lblEmailId.Location = new System.Drawing.Point(20, 250);
            this.lblEmailId.Name = "lblEmailId";
            this.lblEmailId.Size = new System.Drawing.Size(47, 13);
            this.lblEmailId.TabIndex = 7;
            this.lblEmailId.Text = "Email ID:";
            // 
            // lblReferenceName
            // 
            this.lblReferenceName.AutoSize = true;
            this.lblReferenceName.Location = new System.Drawing.Point(20, 280);
            this.lblReferenceName.Name = "lblReferenceName";
            this.lblReferenceName.Size = new System.Drawing.Size(90, 13);
            this.lblReferenceName.TabIndex = 8;
            this.lblReferenceName.Text = "Reference Name:";
            // 
            // txtReferenceId
            // 
            this.txtReferenceId.Location = new System.Drawing.Point(120, 67);
            this.txtReferenceId.Name = "txtReferenceId";
            this.txtReferenceId.ReadOnly = true;
            this.txtReferenceId.Size = new System.Drawing.Size(200, 20);
            this.txtReferenceId.TabIndex = 9;
            // 
            // txtName
            // 
            this.txtName.Location = new System.Drawing.Point(120, 97);
            this.txtName.MaxLength = 150;
            this.txtName.Name = "txtName";
            this.txtName.Size = new System.Drawing.Size(200, 20);
            this.txtName.TabIndex = 10;
            // 
            // txtAddress
            // 
            this.txtAddress.Location = new System.Drawing.Point(120, 127);
            this.txtAddress.MaxLength = 255;
            this.txtAddress.Name = "txtAddress";
            this.txtAddress.Size = new System.Drawing.Size(200, 20);
            this.txtAddress.TabIndex = 11;
            // 
            // txtMobileNo1
            // 
            this.txtMobileNo1.Location = new System.Drawing.Point(120, 187);
            this.txtMobileNo1.MaxLength = 10;
            this.txtMobileNo1.Name = "txtMobileNo1";
            this.txtMobileNo1.Size = new System.Drawing.Size(200, 20);
            this.txtMobileNo1.TabIndex = 13;
            // 
            // txtMobileNo2
            // 
            this.txtMobileNo2.Location = new System.Drawing.Point(120, 217);
            this.txtMobileNo2.MaxLength = 10;
            this.txtMobileNo2.Name = "txtMobileNo2";
            this.txtMobileNo2.Size = new System.Drawing.Size(200, 20);
            this.txtMobileNo2.TabIndex = 14;
            // 
            // txtEmailId
            // 
            this.txtEmailId.Location = new System.Drawing.Point(120, 247);
            this.txtEmailId.MaxLength = 50;
            this.txtEmailId.Name = "txtEmailId";
            this.txtEmailId.Size = new System.Drawing.Size(200, 20);
            this.txtEmailId.TabIndex = 15;
            // 
            // txtReferenceName
            // 
            this.txtReferenceName.Location = new System.Drawing.Point(120, 277);
            this.txtReferenceName.MaxLength = 255;
            this.txtReferenceName.Name = "txtReferenceName";
            this.txtReferenceName.Size = new System.Drawing.Size(200, 20);
            this.txtReferenceName.TabIndex = 16;
            // 
            // cmbCity
            // 
            this.cmbCity.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCity.FormattingEnabled = true;
            this.cmbCity.Location = new System.Drawing.Point(120, 157);
            this.cmbCity.Name = "cmbCity";
            this.cmbCity.Size = new System.Drawing.Size(200, 21);
            this.cmbCity.TabIndex = 12;
            // 
            // chkIsActive
            // 
            this.chkIsActive.AutoSize = true;
            this.chkIsActive.Checked = true;
            this.chkIsActive.CheckState = System.Windows.Forms.CheckState.Checked;
            this.chkIsActive.Location = new System.Drawing.Point(120, 310);
            this.chkIsActive.Name = "chkIsActive";
            this.chkIsActive.Size = new System.Drawing.Size(67, 17);
            this.chkIsActive.TabIndex = 17;
            this.chkIsActive.Text = "Is Active";
            this.chkIsActive.UseVisualStyleBackColor = true;
            // 
            // btnSave
            // 
            this.btnSave.Location = new System.Drawing.Point(120, 340);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(75, 30);
            this.btnSave.TabIndex = 18;
            this.btnSave.Text = "Save";
            this.btnSave.UseVisualStyleBackColor = true;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // btnNew
            // 
            this.btnNew.Location = new System.Drawing.Point(210, 340);
            this.btnNew.Name = "btnNew";
            this.btnNew.Size = new System.Drawing.Size(75, 30);
            this.btnNew.TabIndex = 19;
            this.btnNew.Text = "New";
            this.btnNew.UseVisualStyleBackColor = true;
            this.btnNew.Click += new System.EventHandler(this.btnNew_Click);
            // 
            // btnClose
            // 
            this.btnClose.Location = new System.Drawing.Point(300, 340);
            this.btnClose.Name = "btnClose";
            this.btnClose.Size = new System.Drawing.Size(75, 30);
            this.btnClose.TabIndex = 20;
            this.btnClose.Text = "Close";
            this.btnClose.UseVisualStyleBackColor = true;
            this.btnClose.Click += new System.EventHandler(this.btnClose_Click);
            // 
            // dgvReferences
            // 
            this.dgvReferences.AllowUserToAddRows = false;
            this.dgvReferences.AllowUserToDeleteRows = false;
            this.dgvReferences.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvReferences.Location = new System.Drawing.Point(350, 67);
            this.dgvReferences.Name = "dgvReferences";
            this.dgvReferences.ReadOnly = true;
            this.dgvReferences.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvReferences.Size = new System.Drawing.Size(500, 300);
            this.dgvReferences.TabIndex = 21;
            this.dgvReferences.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvReferences_CellClick);
            // 
            // ReferenceMasterForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(870, 390);
            this.Controls.Add(this.dgvReferences);
            this.Controls.Add(this.btnClose);
            this.Controls.Add(this.btnNew);
            this.Controls.Add(this.btnSave);
            this.Controls.Add(this.chkIsActive);
            this.Controls.Add(this.cmbCity);
            this.Controls.Add(this.txtReferenceName);
            this.Controls.Add(this.txtEmailId);
            this.Controls.Add(this.txtMobileNo2);
            this.Controls.Add(this.txtMobileNo1);
            this.Controls.Add(this.txtAddress);
            this.Controls.Add(this.txtName);
            this.Controls.Add(this.txtReferenceId);
            this.Controls.Add(this.lblReferenceName);
            this.Controls.Add(this.lblEmailId);
            this.Controls.Add(this.lblMobileNo2);
            this.Controls.Add(this.lblMobileNo1);
            this.Controls.Add(this.lblCity);
            this.Controls.Add(this.lblAddress);
            this.Controls.Add(this.lblName);
            this.Controls.Add(this.lblReferenceId);
            this.Controls.Add(this.lblTitle);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.Name = "ReferenceMasterForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Reference Master";
            this.Load += new System.EventHandler(this.ReferenceMasterForm_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvReferences)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblTitle;
        private System.Windows.Forms.Label lblReferenceId;
        private System.Windows.Forms.Label lblName;
        private System.Windows.Forms.Label lblAddress;
        private System.Windows.Forms.Label lblCity;
        private System.Windows.Forms.Label lblMobileNo1;
        private System.Windows.Forms.Label lblMobileNo2;
        private System.Windows.Forms.Label lblEmailId;
        private System.Windows.Forms.Label lblReferenceName;
        private System.Windows.Forms.TextBox txtReferenceId;
        private System.Windows.Forms.TextBox txtName;
        private System.Windows.Forms.TextBox txtAddress;
        private System.Windows.Forms.TextBox txtMobileNo1;
        private System.Windows.Forms.TextBox txtMobileNo2;
        private System.Windows.Forms.TextBox txtEmailId;
        private System.Windows.Forms.TextBox txtReferenceName;
        private System.Windows.Forms.ComboBox cmbCity;
        private System.Windows.Forms.CheckBox chkIsActive;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.Button btnNew;
        private System.Windows.Forms.Button btnClose;
        private System.Windows.Forms.DataGridView dgvReferences;
    }
}