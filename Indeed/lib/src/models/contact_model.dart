

class ContactModel{
  String? name;
  String? company;
  String? address;
  String? update;

  String _data;

  ContactModel(this.name,this.company, this.address,this.update,this._data);

  factory ContactModel.fromJSON(Map json){
    return ContactModel(json['name'],json['company'], json['address'], json['update'],"");
  }

  String get data => _data;

  set data(String value) {
    _data = value;
  }
}