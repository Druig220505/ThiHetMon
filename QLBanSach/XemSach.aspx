<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="XemSach.aspx.cs" Inherits="QLBanSach.XemSach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <h3>Trang xem sách</h3>
    <hr />
    <div class="alert alert-info">
         <div class="form-inline justify-content-center">
              <label class="font-weight-bold">
              Chủ đề</label> <asp:DropDownList ID="ddlChuDe" DataSourceID="odsChuDe" DataTextField="TenCD" DataValueField="MaCD" CssClass="form-control ml-2" runat="server" AutoPostBack="True" ></asp:DropDownList>
         </div>
    </div>
  
   
    <div class="row ">
        <asp:Repeater ID="rptSach" runat="server" DataSourceID="odsSach">
               <ItemTemplate>
               <div class="col-md-4">
                    <div class="card mb-2">
                        <div>
                             <img src="/Bia_sach/<%# Eval("Hinh") %>"  style="width: 300px"/>
                        </div>
                         <br />
                        <div class="card-body">
                            Tên sách <asp:Label ID="lbSach" runat="server" Text='<%# Eval("TenSach") %>'></asp:Label>
                            <br />
                            <%--Giá bán: <asp:Label ID="lbGia" runat="server" Text='<%# Eval("dongia","{0: #,##0} đồng") %>'</asp:Label>--%>
                               
                            <br />
                        </div>
                        <div class="card-footer text-center">
                            <a href="XemChiTiet.aspx?MaSach<%# Eval("MaSach") %>" class="btn btn-success mr-3">Xem chi tiết</a>
                            <a href="ThemVaoGio.aspx?MaSach<%# Eval("MaSach") %>" class="btn btn-info">Đặt mua</a>
                        </div>
                    </div>
                </div>     
               </ItemTemplate>
            </asp:Repeater>
    </div>
    <asp:ObjectDataSource ID="odsChuDe" runat="server" SelectMethod="getAll" TypeName="QLBanSach.Models.ChuDeDAO"></asp:ObjectDataSource>

    <asp:ObjectDataSource ID="odsSach" runat="server" SelectMethod="laySachTheoChuDe" TypeName="QLBanSach.Models.SachDAO">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlChuDe" Name="macd" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
