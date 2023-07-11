codeunit 70100 "TextFile"
{
    trigger OnRun()
    begin

    end;

    procedure SendText(): Text
    var
        InStr: InStream;
        OutStr: OutStream;
        tmpBlob: Codeunit "Temp Blob";
        Base64Convert: Codeunit "Base64 Convert";
        Content: Text;
        tblAPIBody: Record "API Body";
        gTextBase64: Text;
        reportStandardSalesInvoice: Report "Standard Sales - Invoice";
        tblSalesInvoiceHeader: Record "Sales Invoice Header";
        reportPostedSaleInv: Report "Posted Sale Invoice";

    begin
        /*tmpBlob.CreateOutStream(OutStr);
        tmpBlob.CreateInStream(InStr);

        Clear(reportStandardSalesInvoice);
        Clear(tblSalesInvoiceHeader);
        tblSalesInvoiceHeader.SetRange("No.", '103027');
        reportStandardSalesInvoice.SetTableView(tblSalesInvoiceHeader);
        Report.RdlcLayout(1306, InStr);
        reportStandardSalesInvoice.SaveAs('', ReportFormat::Pdf, OutStr);
        CopyStream(OutStr, InStr);
        gTextBase64 := Base64Convert.ToBase64(InStr);
        exit(gTextBase64);*/

        /*tmpBlob.CreateOutStream(OutStr);
        reportStandardSalesInvoice.SetTableView(tblSalesInvoiceHeader);
        reportStandardSalesInvoice.RDLCLayout(InStr);
        reportStandardSalesInvoice.SaveAs('', ReportFormat::Pdf, OutStr);
        CopyStream(OutStr, InStr);
        tmpBlob.CreateInStream(InStr, TextEncoding::UTF8);
        gTextBase64 := Base64Convert.ToBase64(InStr);
        exit(gTextBase64)*/

        tmpBlob.CreateOutStream(OutStr);
        tmpBlob.CreateInStream(InStr);
        tblSalesInvoiceHeader.SetRange("No.", '103027');
        //reportStandardSalesInvoice.SetTableView(tblSalesInvoiceHeader);
        //reportStandardSalesInvoice.SaveAs('', ReportFormat::Pdf, OutStr);
        reportPostedSaleInv.SetTableView(tblSalesInvoiceHeader);
        reportPostedSaleInv.SaveAs('', ReportFormat::Pdf, OutStr);
        gTextBase64 := Base64Convert.ToBase64(InStr);
        CopyStream(OutStr, InStr);
        //reportStandardSalesInvoice.Run();
        exit(gTextBase64)
    end;

    procedure CreateTextFile(tblAPIBody: Record "API Body")
    var
        InStr: InStream;
        OutStr: OutStream;
        tmpBlob: Codeunit "Temp Blob";
        FileName: Text;
        StartTime: Time;
        EndTime: Time;
        ElapsedTime: Integer;
        //HowLong: Duration;  
        CRLF: Text[2];
        Counter: Integer;
    begin
        StartTime := System.Time;
        CRLF[1] := 13;
        CRLF[2] := 10;
        FileName := 'TestFile.txt';
        tmpBlob.CreateOutStream(OutStr, TextEncoding::Windows);
        tblAPIBody.Setrange("idBody", tblAPIBody.idBody);
        if tblAPIBody.FindSet() then
            repeat
                //C Group
                OutStr.WriteText(StrSubstNo('"C","%1","%2","%3"', tblAPIBody."C01-SELLER_TAX_ID", tblAPIBody."C02-SELLER_BRANCH_ID", tblAPIBody."C03-FILE_NAME") + CRLF);
                //H Group
                OutStr.WriteText(StrSubstNo('"H","%1","%2","%3",', tblAPIBody."H01-DOCUMENT_TYPE_CODE", tblAPIBody."H02-DOCUMENT_NAME", tblAPIBody."H03-DOCUMENT_ID"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."H04-DOCUMENT_ISSUE_DTM", tblAPIBody."H05-CREATE_PURPOSE_CODE", tblAPIBody."H06-CREATE_PURPOSE"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."H07-ADDITIONAL_REF_ASSIGN_ID", tblAPIBody."H08-ADDITIONAL_REF_ISSUE_DTM", tblAPIBody."H09-ADDITIONAL_REF_TYPE_CODE"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."H10-ADDITIONAL_REF_DOCUMENT_NAME", tblAPIBody."H11-DELIVERY_TYPE_CODE", tblAPIBody."H12-BUYER_ORDER_ASSIGN_ID"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."H13-BUYER_ORDER_ISSUE_DTM", tblAPIBody."H14-BUYER_ORDER_REF_TYPE_CODE", tblAPIBody."H15-DOCUMENT_REMARK"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."H16-VOUCHER_NO", tblAPIBody."H17-SELLER_CONTACT_PERSON_NAME", tblAPIBody."H18-SELLER_CONTACT_DEPARTMENT_NAME"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."H19-SELLER_CONTACT_URIID", tblAPIBody."H20-SELLER_CONTACT_PHONE_NO", tblAPIBody."H21-FLEX_FIELD"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."H22-SELLER_BRANCH_ID", tblAPIBody."H23-SOURCE_SYSTEM", tblAPIBody."H24-ENCRYPT_PASSWORD"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3"', tblAPIBody."H25-PDF_TEMPLATE_ID", tblAPIBody."H26-SEND_MAIL_IND", tblAPIBody."H27-PDF_NAME") + CRLF);
                //B Group
                OutStr.WriteText(StrSubstNo('"B","%1","%2","%3",', tblAPIBody."B01-BUYER_ID", tblAPIBody."B02-BUYER_NAME", tblAPIBody."B03-BUYER_TAX_ID_TYPE"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."B04-BUYER_TAX_ID", tblAPIBody."B05-BUYER_BRANCH_ID", tblAPIBody."B06-BUYER_CONTACT_PERSON_NAME"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."B07-BUYER_CONTACT_DEPARTMENT_NAME", tblAPIBody."B08-BUYER_URIID", tblAPIBody."B09-BUYER_CONTACT_PHONE_NO"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."B10-BUYER_POST_CODE", tblAPIBody."B11-BUYER_BUILDING_NAME", tblAPIBody."B12-BUYER_BUILDING_NO"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."B13-BUYER_ADDRESS_LINE1", tblAPIBody."B14-BUYER_ADDRESS_LINE2", tblAPIBody."B15-BUYER_ADDRESS_LINE3"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."B16-BUYER_ADDRESS_LINE4", tblAPIBody."B17-BUYER_ADDRESS_LINE5", tblAPIBody."B18-BUYER_STREET_NAME"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."B19-BUYER_CITY_SUB_DIV_ID", tblAPIBody."B20-BUYER_CITY_SUB_DIV_NAME", tblAPIBody."B21-BUYER_CITY_ID"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."B22-BUYER_CITY_NAME", tblAPIBody."B23-BUYER_COUNTRY_SUB_DIV_ID", tblAPIBody."B24-BUYER_COUNTRY_SUB_DIV_NAME"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."B25-BUYER_COUNTRY_ID") + CRLF);
                //F Group
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F01-LINE_TOTAL_COUNT", tblAPIBody."F02-DELIVERY_OCCUR_DTM", tblAPIBody."F03-INVOICE_CURRENCY_CODE"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F04-TAX_TYPE_CODE1", tblAPIBody."F05-TAX_CAL_RATE1", tblAPIBody."F06-BASIS_AMOUNT1"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F07-BASIS_CURRENCY_CODE1", tblAPIBody."F08-TAX_CAL_AMOUNT1", tblAPIBody."F09-TAX_CAL_CURRENCY_CODE1"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F10-TAX_TYPE_CODE2", tblAPIBody."F11-TAX_CAL_RATE2", tblAPIBody."F12-BASIS_AMOUNT2"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F13-BASIS_CURRENCY_CODE2", tblAPIBody."F14-TAX_CAL_AMOUNT2", tblAPIBody."F15-TAX_CAL_CURRENCY_CODE2"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F16-TAX_TYPE_CODE3", tblAPIBody."F17-TAX_CAL_RATE3", tblAPIBody."F18-BASIS_AMOUNT3"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F19-BASIS_CURRENCY_CODE3", tblAPIBody."F20-TAX_CAL_AMOUNT3", tblAPIBody."F21-TAX_CAL_CURRENCY_CODE3"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F22-TAX_TYPE_CODE4", tblAPIBody."F23-TAX_CAL_RATE4", tblAPIBody."F24-BASIS_AMOUNT4"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F25-BASIS_CURRENCY_CODE4", tblAPIBody."F26-TAX_CAL_AMOUNT4", tblAPIBody."F27-TAX_CAL_CURRENCY_CODE4"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F28-ALLOWANCE_CHARGE_IND", tblAPIBody."F29-ALLOWANCE_ACTUAL_AMOUNT", tblAPIBody."F30-ALLOWANCE_ACTUAL_CURRENCY_CODE"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F31-ALLOWANCE_REASON_CODE", tblAPIBody."F32-ALLOWANCE_REASON", tblAPIBody."F33-PAYMENT_TYPE_CODE"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F34-PAYMENT_DESCRIPTION", tblAPIBody."F35-PAYMENT_DUE_DTM", tblAPIBody."F36-ORIGINAL_TOTAL_AMOUNT"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F37-ORIGINAL_TOTAL_CURRENCY_CODE", tblAPIBody."F38-LINE_TOTAL_AMOUNT", tblAPIBody."F39-LINE_TOTAL_CURRENCY_CODE"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F40-ADJUSTED_INFORMATION_AMOUNT", tblAPIBody."F41-ADJUSTED_INFORMATION_CURRENCY_CODE", tblAPIBody."F42-ALLOWANCE_TOTAL_AMOUNT"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F43-ALLOWANCE_TOTAL_CURRENCY_CODE", tblAPIBody."F44-CHARGE_TOTAL_AMOUNT", tblAPIBody."F45-CHARGE_TOTAL_CURRENCY_CODE"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F46-TAX_BASIS_TOTAL_AMOUNT", tblAPIBody."F47-TAX_BASIS_TOTAL_CURRENCY_CODE", tblAPIBody."F48-TAX_TOTAL_AMOUNT"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F49-TAX_TOTAL_CURRENCY_CODE", tblAPIBody."F50-GRAND_TOTAL_AMOUNT", tblAPIBody."F51-GRAND_TOTAL_CURRENCY_CODE"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F52-TERM_PAYMENT", tblAPIBody."F53-WITHHOLDINGTAX_TYPE1", tblAPIBody."F54-WITHHOLDINGTAX_DESCRIPTION1"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F55-WITHHOLDINGTAX_RATE1", tblAPIBody."F56-WITHHOLDINGTAX_BASIS_AMOUNT1", tblAPIBody."F57-WITHHOLDINGTAX_TAX_AMOUNT1"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F58-WITHHOLDINGTAX_TYPE2", tblAPIBody."F59-WITHHOLDINGTAX_DESCRIPTION2", tblAPIBody."F60-WITHHOLDINGTAX_RATE2"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F61-WITHHOLDINGTAX_BASIS_AMOUNT2", tblAPIBody."F62-WITHHOLDINGTAX_TAX_AMOUNT2", tblAPIBody."F63-WITHHOLDINGTAX_TYPE3"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."B04-BUYER_TAX_ID", tblAPIBody."B05-BUYER_BRANCH_ID", tblAPIBody."B06-BUYER_CONTACT_PERSON_NAME"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."B04-BUYER_TAX_ID", tblAPIBody."B05-BUYER_BRANCH_ID", tblAPIBody."B06-BUYER_CONTACT_PERSON_NAME"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."B04-BUYER_TAX_ID", tblAPIBody."B05-BUYER_BRANCH_ID", tblAPIBody."B06-BUYER_CONTACT_PERSON_NAME"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."B04-BUYER_TAX_ID", tblAPIBody."B05-BUYER_BRANCH_ID", tblAPIBody."B06-BUYER_CONTACT_PERSON_NAME"));
                //T Group
                OutStr.WriteText(StrSubstNo('"T","%1"', tblAPIBody."T01-TOTAL_DOCUMENT_COUNT") + CRLF);
            until tblAPIBody.Next() = 0;
        //OutStr.WriteText(StrSubstNo(FileName));
        //OutStr.WriteText('Start time: ' + Format(StartTime) + CRLF);
        //OutStr.WriteText();
        /*for Counter := 1 to 5000000 do begin
            OutStr.WriteText(Format(Counter) + ': This is a line in the text file' + CRLF);
            //OutStr.WriteText();
        end;*/
        EndTime := System.Time;
        //OutStr.WriteText('End time: ' + Format(StartTime) + CRLF);
        // OutStr.WriteText();  
        ElapsedTime := EndTime - StartTime;
        //OutStr.WriteText('Elapsed time: ' + Format(ElapsedTime));
        tmpBlob.CreateInStream(InStr, TextEncoding::Windows);
        DownloadFromStream(InStr, '', '', '', FileName);
    end;
}