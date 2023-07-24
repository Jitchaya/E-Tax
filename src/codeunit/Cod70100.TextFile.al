codeunit 70100 "TextFile"
{
    trigger OnRun()
    begin

    end;

    var
        FileManagement: Codeunit "File Management";
        //TempBlob : Record TempBlob;
        Boundary: Text;
        m_tmpBlob: Codeunit "Temp Blob";

    procedure SendPDF(NotblSalesInvoiceHeader: Text): Text
    var
        InStr: InStream;
        OutStr: OutStream;
        tmpBlob: Codeunit "Temp Blob";
        Base64Convert: Codeunit "Base64 Convert";
        gTextBase64: Text;
        //reportStandardSalesInvoice: Report "Standard Sales - Invoice";
        tblSalesInvoiceHeader: Record "Sales Invoice Header";
        reportPostedSaleInv: Report "Posted Sale Invoice";

    begin
        //if NotblSalesInvoiceHeader <> '' then begin
        tmpBlob.CreateOutStream(OutStr);
        tmpBlob.CreateInStream(InStr);
        tblSalesInvoiceHeader.SetFilter("No.", NotblSalesInvoiceHeader);
        //if tblSalesInvoiceHeader.FindFirst() then begin
        reportPostedSaleInv.SetDocumentNo(NotblSalesInvoiceHeader);
        reportPostedSaleInv.SetTableView(tblSalesInvoiceHeader);
        reportPostedSaleInv.SaveAs('', ReportFormat::Pdf, OutStr);
        gTextBase64 := Base64Convert.ToBase64(InStr);
        CopyStream(OutStr, InStr);
        //end;
        //reportStandardSalesInvoice.SetTableView(tblSalesInvoiceHeader);
        //reportStandardSalesInvoice.SaveAs('', ReportFormat::Pdf, OutStr);
        //reportStandardSalesInvoice.Run();
        //end;
        exit(gTextBase64)
    end;

    procedure PostTextfileTest(tblAPIBody: Record "API Body"; p_tmpBlob: Codeunit "Temp Blob"; p_PayloadInStream: InStream)
    var
        PayloadOutStream: OutStream;
        PayloadInStream: InStream;
        CRLF: Text[2];
        tmpBlob: Codeunit "Temp Blob";
        gAuthorization: Text;
        InStr: InStream;
        FileName: Text;
        tblAPISetup: Record "API Setup";
    begin
        tblAPISetup.Get();
        CRLF[1] := 13;
        CRLF[2] := 10;
        /*gAuthorization := 'MjY6cno2a2lKeGE2Q3JXOFNUcEYzcHlmZW0wN29LRDl3cUxKUTFjV3ZZOTpleUowWVhocFpDSTZJakF4TURVMU1qZ3dNVEF3T0RraUxDSndZWE56ZDI5eVpDSTZJa0Z0ZDJGNUl6RXlNelFpZlE0RVlKV0tpRTlwVHlRcVpZODBlSGZwU01GRlJ1SnFMeQ==';
        ContentHeader.Add('Authorization', 'Bearer ' + gAuthorization);
        Content.GetHeaders(ContentHeader);
        ContentHeader.Clear();
        ContentHeader.Add('Content-Type', 'multipart/form-data;boundary=boundary');*/
        FileName := 'TestFile.txt';
        CreateTextFile(tblAPIBody);
        m_tmpBlob.CreateInStream(InStr, TextEncoding::UTF8);

        p_tmpBlob.CreateOutStream(PayloadOutStream);
        //CopyStream(PayloadOutStream, CreateTextFile(tblAPIBody));
        PayloadOutStream.WriteText('--boundary' + CRLF);
        // key1 value1
        PayloadOutStream.WriteText('Content-Disposition: form-data; name="SellerTaxId"' + CRLF);
        PayloadOutStream.WriteText(CRLF);
        PayloadOutStream.WriteText(tblAPISetup.SellerTaxId + CRLF);
        PayloadOutStream.WriteText('--boundary' + CRLF);
        // key2 value2
        PayloadOutStream.WriteText('Content-Disposition: form-data; name="SellerBranchId"' + CRLF);
        PayloadOutStream.WriteText(CRLF);
        PayloadOutStream.WriteText(tblAPISetup.SellerBranchId + CRLF);
        PayloadOutStream.WriteText('--boundary' + CRLF);
        //Key3 Value3
        PayloadOutStream.WriteText('Content-Disposition: form-data; name="APIKey"' + CRLF);
        PayloadOutStream.WriteText(CRLF);
        PayloadOutStream.WriteText(tblAPISetup.APIKey + CRLF);
        PayloadOutStream.WriteText('--boundary' + CRLF);
        //key4 Value4
        PayloadOutStream.WriteText('Content-Disposition: form-data; name="UserCode"' + CRLF);
        PayloadOutStream.WriteText(CRLF);
        PayloadOutStream.WriteText(tblAPISetup.UserCode + CRLF);
        PayloadOutStream.WriteText('--boundary' + CRLF);
        //key5 Value5
        PayloadOutStream.WriteText('Content-Disposition: form-data; name="AccessKey"' + CRLF);
        PayloadOutStream.WriteText(CRLF);
        PayloadOutStream.WriteText(tblAPISetup.AccessKey + CRLF);
        PayloadOutStream.WriteText('--boundary' + CRLF);
        //key6 Value6
        PayloadOutStream.WriteText('Content-Disposition: form-data; name="ServiceCode"' + CRLF);
        PayloadOutStream.WriteText(CRLF);
        PayloadOutStream.WriteText(tblAPISetup.ServiceCode + CRLF);
        PayloadOutStream.WriteText('--boundary' + CRLF);

        PayloadOutStream.WriteText('Content-Disposition: form-data; name="TextContent"; filename="Test.txt"' + CRLF);
        //CopyStream(PayloadOutStream, InStr);
        PayloadOutStream.WriteText('Content-Type: application/json;charset=UTF-8' + CRLF);
        PayloadOutStream.WriteText(CRLF);

        CopyStream(PayloadOutStream, InStr);
        PayloadOutStream.WriteText(CRLF);
        PayloadOutStream.WriteText('--boundary--');

        p_tmpBlob.CreateInStream(p_PayloadInStream);
    end;

    procedure Download(var tblAPIBody: Record "API Body")
    var
        FileName: Text;
        InStr: InStream;
    begin
        FileName := 'TestFile.txt';
        CreateTextFile(tblAPIBody);
        m_tmpBlob.CreateInStream(InStr, TextEncoding::UTF8);
        DownloadFromStream(InStr, '', '', '', FileName);

    end;

    procedure CreateTextFile(tblAPIBody: Record "API Body"/*; p_Boolean: Boolean*/)
    var
        InStr: InStream;
        OutStr: OutStream;
        //tmpBlob: Codeunit "Temp Blob";
        FileName: Text;
        StartTime: Time;
        EndTime: Time;
        ElapsedTime: Integer;
        CRLF: Text[2];
        Counter: Integer;
        PayloadOutStream: OutStream;
        PayloadInStream: InStream;
        Content: HttpContent;
        ContentHeader: HttpHeaders;
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        gAuthorization: Text;
        gJsonText: Text;
        tblAPILine: Record "API Line";
    begin
        StartTime := System.Time;
        CRLF[1] := 13;
        CRLF[2] := 10;
        FileName := 'TestFile.txt';
        m_tmpBlob.CreateOutStream(OutStr, TextEncoding::Windows);
        tblAPIBody.Setrange("idBody", tblAPIBody.idBody);
        /*if tblAPIBody.FindSet() then
            repeat*/
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
        OutStr.WriteText(StrSubstNo('"%1","%2","%3"', tblAPIBody."B25-BUYER_COUNTRY_ID") + CRLF);
        //L Group
        tblAPILine.SetRange("idBody", tblAPIBody.idBody);
        if tblAPILine.FindSet() then
            repeat
                OutStr.WriteText(StrSubstNo('"L","%1","%2","%3",', tblAPILine."L01-LINE_ID", tblAPILine."L02-PRODUCT_ID", tblAPILine."L03-PRODUCT_NAME"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPILine."L04-PRODUCT_DESC", tblAPILine."L05-PRODUCT_BATCH_ID", tblAPILine."L06-PRODUCT_EXPIRE_DTM"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPILine."L07-PRODUCT_CLASS_CODE", tblAPILine."L08-PRODUCT_CLASS_NAME", tblAPILine."L09-PRODUCT_ORIGIN_COUNTRY_ID"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPILine."L10-PRODUCT_CHARGE_AMOUNT", tblAPILine."L11-PRODUCT_CHARGE_CURRENCY_CODE", tblAPILine."L12-PRODUCT_ALLOWANCE_CHARGE_IND"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPILine."L13-PRODUCT_ALLOWANCE_ACTUAL_AMOUNT", tblAPILine."L14-PRODUCT_ALLOWANCE_ACTUAL_CURRENCY_CODE", tblAPILine."L15-PRODUCT_ALLOWANCE_REASON_CODE"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPILine."L16-PRODUCT_ALLOWANCE_REASON", tblAPILine."L17-PRODUCT_QUANTITY", tblAPILine."L18-PRODUCT_UNIT_CODE"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPILine."L19-PRODUCT_QUANTITY_PER_UNIT", tblAPILine."L20-LINE_TAX_TYPE_CODE", tblAPILine."L21-LINE_TAX_CAL_RATE"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPILine."L22-LINE_BASIS_AMOUNT", tblAPILine."L23-LINE_BASIS_CURRENCY_CODE", tblAPILine."L24-LINE_TAX_CAL_AMOUNT"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPILine."L25-LINE_TAX_CAL_CURRENCY_CODE", tblAPILine."L26-LINE_ALLOWANCE_CHARGE_IND", tblAPILine."L27-LINE_ALLOWANCE_ACTUAL_AMOUNT"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPILine."L28-LINE_ALLOWANCE_ACTUAL_CURRENCY_CODE", tblAPILine."L29-LINE_ALLOWANCE_REASON_CODE", tblAPILine."L30-LINE_ALLOWANCE_REASON"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPILine."L31-LINE_TAX_TOTAL_AMOUNT", tblAPILine."L32-LINE_TAX_TOTAL_CURRENCY_CODE", tblAPILine."L33-LINE_NET_TOTAL_AMOUNT"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPILine."L34-LINE_NET_TOTAL_CURRENCY_CODE", tblAPILine."L35-LINE_NET_INCLUDE_TAX_TOTAL_AMOUNT", tblAPILine."L36-LINE_NET_INCLUDE_TAX_TOTAL_CURRENCY_CODE"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPILine."L37-PRODUCT_REMARK1", tblAPILine."L38-PRODUCT_REMARK2", tblAPILine."L39-PRODUCT_REMARK3"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPILine."L40-PRODUCT_REMARK4", tblAPILine."L41-PRODUCT_REMARK5", tblAPILine."L42-PRODUCT_REMARK6"));
                OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPILine."L43-PRODUCT_REMARK7", tblAPILine."L44-PRODUCT_REMARK8", tblAPILine."L45-PRODUCT_REMARK9"));
                OutStr.WriteText(StrSubstNo('"%1"', tblAPILine."L46-PRODUCT_REMARK10"));
            until tblAPILine.Next() = 0;        //F Group
        OutStr.WriteText(CRLF);
        //F Group
        OutStr.WriteText(StrSubstNo('"F","%1","%2","%3",', tblAPIBody."F01-LINE_TOTAL_COUNT", tblAPIBody."F02-DELIVERY_OCCUR_DTM", tblAPIBody."F03-INVOICE_CURRENCY_CODE"));
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
        OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F64-WITHHOLDINGTAX_DESCRIPTION3", tblAPIBody."F65-WITHHOLDINGTAX_RATE3", tblAPIBody."F66-WITHHOLDINGTAX_BASIS_AMOUNT3"));
        OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F67-WITHHOLDINGTAX_TAX_AMOUNT3", tblAPIBody."F68-WITHHOLDINGTAX_TOTAL_AMOUNT", tblAPIBody."F69-ACTUAL_PAYMENT_TOTAL_AMOUNT"));
        OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F70-DOCUMENT_REMARK1", tblAPIBody."F71-DOCUMENT_REMARK2", tblAPIBody."F72-DOCUMENT_REMARK3"));
        OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F73-DOCUMENT_REMARK4", tblAPIBody."F74-DOCUMENT_REMARK5", tblAPIBody."F75-DOCUMENT_REMARK6"));
        OutStr.WriteText(StrSubstNo('"%1","%2","%3",', tblAPIBody."F76-DOCUMENT_REMARK7", tblAPIBody."F77-DOCUMENT_REMARK8", tblAPIBody."F78-DOCUMENT_REMARK9"));
        OutStr.WriteText(StrSubstNo('"%1"', tblAPIBody."F79-DOCUMENT_REMARK10") + CRLF);
        //T Group
        OutStr.WriteText(StrSubstNo('"T","%1"', tblAPIBody."T01-TOTAL_DOCUMENT_COUNT") + CRLF);
        //until tblAPIBody.Next() = 0;
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
        //m_tmpBlob.CreateInStream(InStr, TextEncoding::UTF8);
        /*if p_Boolean then begin
            DownloadFromStream(InStr, '', '', '', FileName);
        end
        else begin
            gAuthorization := 'MjY6cno2a2lKeGE2Q3JXOFNUcEYzcHlmZW0wN29LRDl3cUxKUTFjV3ZZOTpleUowWVhocFpDSTZJakF4TURVMU1qZ3dNVEF3T0RraUxDSndZWE56ZDI5eVpDSTZJa0Z0ZDJGNUl6RXlNelFpZlE0RVlKV0tpRTlwVHlRcVpZODBlSGZwU01GRlJ1SnFMeQ==';
            Request.SetRequestUri('https://uatservice-etax.one.th/etaxjsonws/etaxsigndocument');
            Request.Method := 'POST';
            Content.GetHeaders(ContentHeader);
            ContentHeader.Add('Authorization', 'Bearer ' + gAuthorization);
            ContentHeader.Clear();
            ContentHeader.Add('Content-Type', 'multipart/form-data;boundary=boundary');

            tmpBlob.CreateOutStream(PayloadOutStream);
            tmpBlob.CreateInStream(PayloadInStream);
            //CopyStream(PayloadOutStream, CreateTextFile(tblAPIBody));
            PayloadOutStream.WriteText('--boundary' + CRLF);
            // key1 value1
            PayloadOutStream.WriteText('Content-Disposition: form-data; name="SellerTaxId"' + CRLF);
            PayloadOutStream.WriteText(CRLF);
            PayloadOutStream.WriteText('0105532097525' + CRLF);
            PayloadOutStream.WriteText('--boundary' + CRLF);
            // key2 value2
            PayloadOutStream.WriteText('Content-Disposition: form-data; name="SellerBranchId"' + CRLF);
            PayloadOutStream.WriteText(CRLF);
            PayloadOutStream.WriteText('00000' + CRLF);
            PayloadOutStream.WriteText('--boundary' + CRLF);
            //Key3 Value3
            PayloadOutStream.WriteText('Content-Disposition: form-data; name="APIKey"' + CRLF);
            PayloadOutStream.WriteText(CRLF);
            PayloadOutStream.WriteText('AK2-3UY8R84Q6LIZ5A18IDZH6JI3O63IZLJLJH01CS1OUHRTWR5VG4AED7UCTA5HKE92JJLN1R1DZT74WCDN9PI4L4JM7B62ULRNQTHJ4EO85IYUELWWVG5R7EX8AHQNQY8YNW21Y8Q5EE46P0GQUEOFY700LLOCIBOLRXG0ZVY3J9IUWQOTYBB9TJ85DKSIU8E93MIF8NQ89HRYGGNI4U7K69DZQ9H0EGG0YC2Z09O90J77COR0HCQK9W9SALBWE3E6I' + CRLF);
            PayloadOutStream.WriteText('--boundary' + CRLF);
            //key4 Value4
            PayloadOutStream.WriteText('Content-Disposition: form-data; name="UserCode"' + CRLF);
            PayloadOutStream.WriteText(CRLF);
            PayloadOutStream.WriteText('kpt1993test' + CRLF);
            PayloadOutStream.WriteText('--boundary' + CRLF);
            //key5 Value5
            PayloadOutStream.WriteText('Content-Disposition: form-data; name="AccessKey"' + CRLF);
            PayloadOutStream.WriteText(CRLF);
            PayloadOutStream.WriteText('P@ssw0rd' + CRLF);
            PayloadOutStream.WriteText('--boundary' + CRLF);
            //key6 Value6
            PayloadOutStream.WriteText('Content-Disposition: form-data; name="ServiceCode"' + CRLF);
            PayloadOutStream.WriteText(CRLF);
            PayloadOutStream.WriteText('S03' + CRLF);
            PayloadOutStream.WriteText('--boundary' + CRLF);
            //key7 Value7
            PayloadOutStream.WriteText('Content-Disposition: form-data; name="Authorization"' + CRLF);
            PayloadOutStream.WriteText(CRLF);
            PayloadOutStream.WriteText('Mjc6R29DY1JvRlA5RGc5QUhlNWh6aU15MUxvRHFwM1RJNXpTVTVrVUVTRTpleUowWVhocFpDSTZJakF4TURVMU16SXdPVGMxTWpVaUxDSndZWE56ZDI5eVpDSTZJbXR3ZEVCUVlYTnpNREVpZlE0QmFDTTZQd0FDdVEyS2phWFBQVm1RNldBbXptZ2w2Vg==' + CRLF);
            PayloadOutStream.WriteText('--boundary' + CRLF);

            PayloadOutStream.WriteText('Content-Disposition: form-data; name="TextContent"; fileName="Test.mp3"' + CRLF);
            PayloadOutStream.WriteText('Content-Type: multipart/form-data' + CRLF);
            PayloadOutStream.WriteText(CRLF);

            CopyStream(PayloadOutStream, PayloadInStream);
            PayloadOutStream.WriteText(NewLine);
            PayloadOutStream.WriteText('--boundary--');
            Content.WriteFrom(PayloadInStream);
            Request.Content := Content;
            Client.Send(Request, Response);
            Response.Content.ReadAs(gJsonText);
            Message(gJsonText);*/
        /*if not Response.IsSuccessStatusCode() then
            Error('Failed to upload the file.');*/
        //end;
        // exit(InStr);
        //DownloadFromStream(InStr, '', '', '', FileName);
        //PostTextfileTest(InStr);
        //DownloadTextfile(InStr);
    end;
}