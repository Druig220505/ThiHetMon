<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ThemSach.aspx.cs" Inherits="QLBanSach.ThemSach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <h2>THÊM SÁCH MỚI</h2>
    <hr />
    <div class="w-100">

        <div class="form-group">
            <label class="font-weight-bold">Tên sách</label>
           <asp:TextBox ID="txtTenSach" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:RequiredFieldValidator ID="rfvTenSach" runat="server" ErrorMessage="Chưa đặt tên sách" Text="(*)" ControlToValidate="txtTenSach" ForeColor="#CC3300" ></asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label class="font-weight-bold">Đơn giá</label>
           <asp:TextBox ID="txtDongia" runat="server" CssClass="form-control"></asp:TextBox>
          <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Đơn giá không được nhỏ hơn hoặc bằng 0" Text="(*)" ControlToValidate="txtDongia" ForeColor="#CC3300" Operator="GreaterThan" Type="Integer" ValueToCompare="0">(*)</asp:CompareValidator>
       </div>
        <div class="form-group">
            <label class="font-weight-bold">Chủ đề</label>
           <asp:DropDownList ID="ddlChuDe" runat="server" CssClass="form-control" DataSourceID="odsChuDe" DataTextField="TenCD" DataValueField="MaCD"></asp:DropDownList>
     </div>
        <div class="form-group">
            <label class="font-weight-bold">Ảnh bìa sách</label>
            <asp:FileUpload ID="FHinh" runat="server" CssClass="form-control-file" />
        </div>
        <div class="form-group">
            <label class="font-weight-bold">Khuyến mãi</label>
            <asp:CheckBox ID="chkKhuyenMai" runat="server" Checked="true" CssClass="form-check" />
        </div>
        <asp:Button ID="btXuLy" runat="server" Text="Lưu" CssClass="btn btn-success" OnClick="btXuLy_Click" />

    </div>
    <br />
     <asp:Label ID="lbThongBao" runat="server" Text="" ForeColor="#cc3300"></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="#FF3300" />
    <asp:ObjectDataSource ID="odsChuDe" runat="server" SelectMethod="getAll" TypeName="QLBanSach.Models.ChuDeDAO"></asp:ObjectDataSource>
</asp:Content>
