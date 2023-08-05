

class AppUrl {


  static var baseUrl = 'https://reqres.in' ;


  // static var loginEndPint =  '$baseUrl/api/login' ;

  static var registerApiEndPoint =  '$baseUrl/api/register' ;

  // static var domain = 'http://192.168.1.4:80';
  static var domain = 'https://ukcdesigner.in';
  static var mainUrl = '$domain/approvalzone/index.php';
  static var subMainUrl = '$domain/approvalzone/';
  // static var mainUrl = 'https://ukcdesigner.in/approvalzone/index.php';
  // static var subMainUrl = 'https://ukcdesigner.in/approvalzone/';

  static var loginEndPint =  '$mainUrl/ApiLabour/login' ;
  static var laborHeadListEndPoint =  '$mainUrl/ApiLabour/labour_head_list' ;
  static var labourListEndPoint =  '$mainUrl/ApiLabour/labour_list' ;
  static var labourRegEndPoint =  '$mainUrl/ApiLabour/labour_reg' ;
  static var siteListEndPoint =  '$mainUrl/ApiLabour/site_list' ;
  static var materialSiteListEndPoint =  '$mainUrl/ApiLabour/material_site_list' ;
  static var stageListEndPoint =  '$mainUrl/ApiLabour/stage_list' ;
  static var labourAttendanceEndPoint =  '$mainUrl/ApiLabour/labour_attendance' ;
  static var labourAddAttendanceEndPoint = '$mainUrl/ApiLabour/ajax_lab_attandance' ;
  static var labourAttendanceListEndPoint =  '$mainUrl/ApiLabour/labour_attandance_list' ;
  static var labourDeleteAttendanceEndPoint =  '$mainUrl/ApiLabour/labour_attandance_delete' ;
  static var labourPaymentListEndPoint =  '$mainUrl/ApiLabour/labour_payment' ;
  static var requestMatListEndPoint =  '$mainUrl/ApiLabour/request_mat_list' ;
  static var requestedMatListEndPoint =  '$mainUrl/ApiLabour/requested_mat_list' ;
  static var addRequestMatListEndPoint =  '$mainUrl/ApiLabour/add_request_mat_list' ;
  static var materialRequestedListEndPoint =  '$mainUrl/ApiLabour/material_requested_list' ;
  static var materialReceivedEndPoint =  '$mainUrl/ApiLabour/material_received' ;
  static var siteWiseStockEndPoint =  '$mainUrl/ApiLabour/site_wise_stock' ;
  // static var receivingHistoryEndPoint =  '$mainUrl/ApiLabour/receiving_history' ;
  static var receivingHistoryEndPoint =  '$mainUrl/ApiLabour/receiving_history' ;
  static var labourDashboardEndPoint =  '$mainUrl/ApiLabour/labour_dashboard' ;


  static var excelDownloadPaymentEndPoint =  'https://ukcdesigner.in/approvalzone/excel/excel_labour_payment.php' ;
  static var pdfDownloadPaymentEndPoint =  'https://ukcdesigner.in/approvalzone/export/lab_salary_template/' ;
  static var pdfDownloadAttendanceEndPoint =  '$mainUrl/export/labour_attandance_pdf/' ;


  static var cctvMain =  '$domain/approvalzone/index.php/ClientManagerApi' ;
  static var cctvDetails =  '$cctvMain/cctv_details' ;
  static var manualUploadedImage =  '$cctvMain/manualUploadedImages' ;
  static var siteImagesEndPoint =  '$cctvMain/upload_image' ;
  static const String imageUrl  = "https://ukcdesigner.in/site_camera_data/";
}
