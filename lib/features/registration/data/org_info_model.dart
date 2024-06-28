class OrgInfoModel{
   String name ='';
   List<Branches>? branches;
   int employees =0;
  OrgInfoModel({this.name ='', this.branches,this.employees =0});
}
class Branches {
   String? name;
   String? adress;
   List<SectorCoordinates>? branchSector;
  Branches({this.name,this.adress, this.branchSector});
}
class SectorCoordinates{
   String? lat;
   String? long;
 SectorCoordinates({this.lat, this.long});
}