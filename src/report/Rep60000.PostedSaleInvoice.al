report 60000 "Posted Sale Invoice"
{
    Caption = 'Posted Sale Invoice Report';
    UsageCategory = Administration;
    ApplicationArea = All;
    RDLCLayout = 'src\reportlayout\Rep60000.PostedSaleInvoice.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("No.");

            column(Company_Name; m_tblCompanyInfo.Name)
            {
            }
            column(Company_Name2; m_tblCompanyInfo."Name 2")
            {
            }
            column(Company_Address; m_tblCompanyInfo.Address)
            {
            }
            column(Company_Address2; m_tblCompanyInfo."Address 2")
            {
            }
            column(Company_Phone; m_tblCompanyInfo."Phone No.")
            {
            }
            column(Company_VATRegistrationNo; m_tblCompanyInfo."VAT Registration No.")
            {
            }
            column(Company_Logo; m_tblCompanyInfo.Picture)
            {
            }
            column(TotalAmount; m_vTotalAmount)
            {
            }
            column(TotalDiscount; m_vTotalDiscount)
            {
            }
            column(TotalAmountAfterDiscount; m_vTotalAmountAfterDiscount)
            {
            }
            column(TotalVatAmount; m_vTotalVatAmount)
            {
            }
            column(GrandTotalAmount; m_vGrandTotalAmount)
            {
            }
            column(SelltoCustomer_No; "Sell-to Customer No.")
            {
            }
            column(SelltoCustomer_Name; "Sell-to Customer Name")
            {
            }
            column(Sellto_Address; "Sell-to Address")
            {
            }
            column(Sellto_Address2; "Sell-to Address 2")
            {
            }
            column(Sellto_Phone; "Sell-to Phone No.")
            {
            }
            column(Shipto_Name; "Ship-to Name")
            {
            }
            column(Shipto_Address; "Ship-to Address")
            {
            }
            column(Shipto_Address2; "Ship-to Address 2")
            {
            }
            column(Sellto_No; "No.")
            {
            }
            column(PostingDate; "Posting Date")
            {
            }
            column(PaymentTermsCode; "Payment Terms Code")
            {
            }
            column(DueDate; "Due Date")
            {
            }
            column(Salesperson; m_tblSalesPurchPerson.Name)
            {
            }
            //เลขที่ใบสั่งซื้อ

            dataitem(Line; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.");
                column(Line_No;
                "Line No.")
                {
                }
                column(Line_Description; Description)
                {
                }
                column(Line_Quantity; Quantity)
                {
                }
                column(Line_UnitofMeasure; "Unit of Measure")
                {
                }
                column(Line_UnitPrice; "Unit Price")
                {
                }
                column(Line_Discount; "Line Discount %")
                {
                }
                column(Line_Amount; Amount)
                {
                }
                trigger OnAfterGetRecord();
                var
                    qShowInternalInfo: Boolean;
                    iLine: Integer;
                    tblUnitofMeasure: Record "Unit of Measure";
                begin
                    if (Type = Type::"G/L Account") then
                        "No." := '';

                    /*m_tblVATAmountLine.Init();
                    m_tblVATAmountLine."VAT Identifier" := "VAT Identifier";
                    m_tblVATAmountLine."VAT Calculation Type" := "VAT Calculation Type";
                    m_tblVATAmountLine."Tax Group Code" := "Tax Group Code";
                    m_tblVATAmountLine."VAT %" := "VAT %";
                    m_tblVATAmountLine."VAT Base" := Amount;
                    m_tblVATAmountLine."Amount Including VAT" := "Amount Including VAT";
                    m_tblVATAmountLine."Line Amount" := "Line Amount";
                    if "Allow Invoice Disc." then
                        m_tblVATAmountLine."Inv. Disc. Base Amount" := "Line Amount";
                    m_tblVATAmountLine."Invoice Discount Amount" := "Inv. Discount Amount";
                    m_tblVATAmountLine.InsertLine();*/

                end;
            }
            trigger OnPreDataItem()
            begin
                if m_gDocumentNo <> '' then begin
                    "Sales Invoice Header".SetRange("No.", m_gDocumentNo);
                end;

            end;
        }
    }
    /*
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Name; SourceExpression)
                    {
                        ApplicationArea = All;
                        
                    }
                }
            }
        }
    }*/
    trigger OnInitReport()
    var
        tblCompanyInfo: Record "Company Information";
        tblCompanyInfo2: Record "Company Information";
        tblSalesSetup: Record "Sales & Receivables Setup";
    begin
        m_tblGLSetup.Get();
        m_tblCompanyInfo.Get();
        m_tblCompanyInfo.CalcFields(Picture);
        tblSalesSetup.Get();

        /*case tblSalesSetup."Logo Position on Documents" of
            tblSalesSetup."Logo Position on Documents"::"No Logo":
                ;
            tblSalesSetup."Logo Position on Documents"::Left:
                begin
                    m_tblCompanyInfo.CALCFIELDS(Picture);
                end;
            tblSalesSetup."Logo Position on Documents"::Center:
                begin
                    tblCompanyInfo.Get();
                    tblCompanyInfo.CALCFIELDS(Picture);
                end;
            tblSalesSetup."Logo Position on Documents"::Right:
                begin
                    tblCompanyInfo2.Get();
                    tblCompanyInfo2.CALCFIELDS(Picture);
                end;
        end;*/
    end;

    var
        m_tblGLSetup: Record "General Ledger Setup";
        m_tblCompanyInfo: Record "Company Information";
        m_tblCust: Record Customer;
        m_tblPaymentTerms: Record "Payment Terms";
        m_tblSalesPurchPerson: Record "Salesperson/Purchaser";
        m_tblVATAmountLine: Record "VAT Amount Line" temporary;
        m_vLineAmountExclDiscount: Decimal;
        m_vTotalAmount: Decimal;
        m_vTotalDiscount: Decimal;
        m_vTotalAmountAfterDiscount: Decimal;
        m_vTotalVatAmount: Decimal;
        m_vGrandTotalAmount: Decimal;
        m_vTotalIncAmount: Decimal;
        m_gDocumentNo: Text;

    procedure SetDocumentNo(p_text: Text)
    begin
        m_gDocumentNo := p_text;
    end;

    local procedure z_CalAmountTotal()
    var
        tblSalesLine: Record "Sales Invoice Line";
    begin
        Clear(m_vTotalAmount);
        Clear(m_vTotalAmountAfterDiscount);
        Clear(m_vTotalDiscount);
        Clear(m_vGrandTotalAmount);

        Clear(tblSalesLine);
        tblSalesLine.SetRange("Document No.", "Sales Invoice Header"."No.");
        tblSalesLine.SetFilter(Type, '<>%1', tblSalesLine.Type::"G/L Account");
        if tblSalesLine.FindSet() then begin
            repeat
                m_vTotalAmount += tblSalesLine."Line Amount" + tblSalesLine."Line Discount Amount";
                m_vTotalDiscount += tblSalesLine."Line Discount Amount" + tblSalesLine."Inv. Discount Amount";
                m_vTotalIncAmount += tblSalesLine."Amount Including VAT";
            until tblSalesLine.Next() = 0;

            m_vTotalAmountAfterDiscount := m_vTotalAmount - m_vTotalDiscount;
        end;
    end;
}