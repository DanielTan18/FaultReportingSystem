import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fyp1_test/models/faultreport.dart';

class FaultReportServices {
  String collection = "faultreport";
  Firestore _firestore = Firestore.instance;

  Future<List<FaultReportModel>> getUserReports({String userId}) async =>
      _firestore
          .collection(collection)
          .where("userId", isEqualTo: userId)
          .getDocuments()
          .then((result) {
        List<FaultReportModel> reports = [];
        for (DocumentSnapshot report in result.documents) {
          reports.add(FaultReportModel.fromSnapshot(report));
        }
        return reports;
      });

  Future<List<FaultReportModel>> getAllReports() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<FaultReportModel> reports = [];
        for (DocumentSnapshot report in result.documents) {
          reports.add(FaultReportModel.fromSnapshot(report));
        }
        return reports;
      });

  void createFaultReport(
      {String id,
      String description,
      String faulttype,
      String image,
      String location,
      double lat,
      double lng,
      String userId,
      String status,
      String department,
      String urgency,
      String streetlightno}) {
    _firestore.collection(collection).document(id).setData({
      "id": id,
      "description": description,
      "faulttype": faulttype,
      "image": image,
      "location": location,
      "lat": lat,
      "lng": lng,
      "userId": userId,
      "createdAt": DateTime.now().millisecondsSinceEpoch,
      "status": status,
      "department": department,
      "urgency": urgency,
      "streetlightno": streetlightno,
    });
  }

  void updateFaultData(
      {String id, String status, String department, String urgency}) {
    _firestore.collection(collection).document(id).updateData(
        {"status": status, "department": department, "urgency": urgency});
  }

  Future<FaultReportModel> getFaultReportById({String id}) => _firestore
          .collection(collection)
          .document(id.toString())
          .get()
          .then((doc) {
        return FaultReportModel.fromSnapshot(doc);
      });
}
