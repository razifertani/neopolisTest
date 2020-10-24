class Profile {
  String idUser;
  String idSession;
  int active;
  Address address;
  String birthDate;
  bool error;
  String expirePassword;
  String firstName;
  String lastName;
  Null lastUpdatePwd;
  String mail;
  String mail2;
  String message;
  String mobile;
  String mobile2;
  PreferenceUser preferenceUser;
  Null role;
  String tel;
  String tel2;
  List<UserEmergencyContact> userEmergencyContact;
  String userIdLanguage;
  List<UserMembers> userMembers;
  List<UserRelation> userRelation;
  List<UserTags> userTags;

  Profile(
      {this.idUser,
      this.idSession,
      this.active,
      this.address,
      this.birthDate,
      this.error,
      this.expirePassword,
      this.firstName,
      this.lastName,
      this.lastUpdatePwd,
      this.mail,
      this.mail2,
      this.message,
      this.mobile,
      this.mobile2,
      this.preferenceUser,
      this.role,
      this.tel,
      this.tel2,
      this.userEmergencyContact,
      this.userIdLanguage,
      this.userMembers,
      this.userRelation,
      this.userTags});

  Profile.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
    idSession = json['idSession'];
    active = json['active'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    birthDate = json['birth_date'];
    error = json['error'];
    expirePassword = json['expire_password'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    lastUpdatePwd = json['last_update_pwd'];
    mail = json['mail'];
    mail2 = json['mail2'];
    message = json['message'];
    mobile = json['mobile'];
    mobile2 = json['mobile2'];
    preferenceUser = json['preference_user'] != null
        ? new PreferenceUser.fromJson(json['preference_user'])
        : null;
    role = json['role'];
    tel = json['tel'];
    tel2 = json['tel2'];
    if (json['user_emergency_contact'] != null) {
      userEmergencyContact = new List<UserEmergencyContact>();
      json['user_emergency_contact'].forEach((v) {
        userEmergencyContact.add(new UserEmergencyContact.fromJson(v));
      });
    }
    userIdLanguage = json['user_id_language'];
    if (json['user_members'] != null) {
      userMembers = new List<UserMembers>();
      json['user_members'].forEach((v) {
        userMembers.add(new UserMembers.fromJson(v));
      });
    }
    if (json['user_relation'] != null) {
      userRelation = new List<UserRelation>();
      json['user_relation'].forEach((v) {
        userRelation.add(new UserRelation.fromJson(v));
      });
    }
    if (json['user_tags'] != null) {
      userTags = new List<UserTags>();
      json['user_tags'].forEach((v) {
        userTags.add(new UserTags.fromJson(v));
      });
    }
  }

  @override
  String toString() {
    return "[" + this.firstName + " " + this.lastName + " " + this.mail + "]";
  }
}

class Address {
  String additionalAdress;
  String countryLabel;
  String cp;
  String depName;
  String geom;
  String latt;
  String lng;
  String regionName;
  String stateLabel;
  String streetName;

  Address(
      {this.additionalAdress,
      this.countryLabel,
      this.cp,
      this.depName,
      this.geom,
      this.latt,
      this.lng,
      this.regionName,
      this.stateLabel,
      this.streetName});

  Address.fromJson(Map<String, dynamic> json) {
    additionalAdress = json['additional_adress'];
    countryLabel = json['country_label'];
    cp = json['cp'];
    depName = json['dep_name'];
    geom = json['geom'];
    latt = json['latt'];
    lng = json['lng'];
    regionName = json['region_name'];
    stateLabel = json['state_label'];
    streetName = json['street_name'];
  }
}

class PreferenceUser {
  IdAllowChat idAllowChat;
  IdAllowChat idAllowFirstName;
  IdAllowChat idDeclareLostTag;
  IdAllowChat idDefaultThankyou;
  IdAllowChat idEmailFrequency;
  IdAllowChat idEmailMessages;
  IdAllowChat idEmailNewproduct;
  IdAllowChat idEmailTips;
  IdAllowChat idIncludeMail1;
  IdAllowChat idIncludeMail2;
  IdAllowChat idIncludeMobile1;
  IdAllowChat idIncludeMobile2;
  IdAllowChat idIncludeRealAddress;
  IdAllowChat idIncludeTel1;
  IdAllowChat idIncludeTel2;
  IdAllowChat idRewardActive;
  IdAllowChat idRewardCurrency;
  IdAllowChat idRewardSum;

  PreferenceUser(
      {this.idAllowChat,
      this.idAllowFirstName,
      this.idDeclareLostTag,
      this.idDefaultThankyou,
      this.idEmailFrequency,
      this.idEmailMessages,
      this.idEmailNewproduct,
      this.idEmailTips,
      this.idIncludeMail1,
      this.idIncludeMail2,
      this.idIncludeMobile1,
      this.idIncludeMobile2,
      this.idIncludeRealAddress,
      this.idIncludeTel1,
      this.idIncludeTel2,
      this.idRewardActive,
      this.idRewardCurrency,
      this.idRewardSum});

  PreferenceUser.fromJson(Map<String, dynamic> json) {
    idAllowChat = json['id_allow_chat'] != null
        ? new IdAllowChat.fromJson(json['id_allow_chat'])
        : null;
    idAllowFirstName = json['id_allow_first_name'] != null
        ? new IdAllowChat.fromJson(json['id_allow_first_name'])
        : null;
    idDeclareLostTag = json['id_declare_lost_tag'] != null
        ? new IdAllowChat.fromJson(json['id_declare_lost_tag'])
        : null;
    idDefaultThankyou = json['id_default_thankyou'] != null
        ? new IdAllowChat.fromJson(json['id_default_thankyou'])
        : null;
    idEmailFrequency = json['id_email_frequency'] != null
        ? new IdAllowChat.fromJson(json['id_email_frequency'])
        : null;
    idEmailMessages = json['id_email_messages'] != null
        ? new IdAllowChat.fromJson(json['id_email_messages'])
        : null;
    idEmailNewproduct = json['id_email_newproduct'] != null
        ? new IdAllowChat.fromJson(json['id_email_newproduct'])
        : null;
    idEmailTips = json['id_email_tips'] != null
        ? new IdAllowChat.fromJson(json['id_email_tips'])
        : null;
    idIncludeMail1 = json['id_include_mail1'] != null
        ? new IdAllowChat.fromJson(json['id_include_mail1'])
        : null;
    idIncludeMail2 = json['id_include_mail2'] != null
        ? new IdAllowChat.fromJson(json['id_include_mail2'])
        : null;
    idIncludeMobile1 = json['id_include_mobile1'] != null
        ? new IdAllowChat.fromJson(json['id_include_mobile1'])
        : null;
    idIncludeMobile2 = json['id_include_mobile2'] != null
        ? new IdAllowChat.fromJson(json['id_include_mobile2'])
        : null;
    idIncludeRealAddress = json['id_include_real_address'] != null
        ? new IdAllowChat.fromJson(json['id_include_real_address'])
        : null;
    idIncludeTel1 = json['id_include_tel1'] != null
        ? new IdAllowChat.fromJson(json['id_include_tel1'])
        : null;
    idIncludeTel2 = json['id_include_tel2'] != null
        ? new IdAllowChat.fromJson(json['id_include_tel2'])
        : null;
    idRewardActive = json['id_reward_active'] != null
        ? new IdAllowChat.fromJson(json['id_reward_active'])
        : null;
    idRewardCurrency = json['id_reward_currency'] != null
        ? new IdAllowChat.fromJson(json['id_reward_currency'])
        : null;
    idRewardSum = json['id_reward_sum'] != null
        ? new IdAllowChat.fromJson(json['id_reward_sum'])
        : null;
  }
}

class IdAllowChat {
  String accesLabelTxt;
  int active;
  String classAndroid;
  String classIos;
  String classWeb;
  int idAccesLabel;
  int idField;
  String idFieldApp;
  int idFieldModel;
  int idFieldType;
  int idForm;
  String serialization;
  String typeField;
  String value;

  IdAllowChat(
      {this.accesLabelTxt,
      this.active,
      this.classAndroid,
      this.classIos,
      this.classWeb,
      this.idAccesLabel,
      this.idField,
      this.idFieldApp,
      this.idFieldModel,
      this.idFieldType,
      this.idForm,
      this.serialization,
      this.typeField,
      this.value});

  IdAllowChat.fromJson(Map<String, dynamic> json) {
    accesLabelTxt = json['acces_label_txt'];
    active = json['active'];
    classAndroid = json['class_android'];
    classIos = json['class_ios'];
    classWeb = json['class_web'];
    idAccesLabel = json['id_acces_label'];
    idField = json['id_field'];
    idFieldApp = json['id_field_app'];
    idFieldModel = json['id_field_model'];
    idFieldType = json['id_field_type'];
    idForm = json['id_form'];
    serialization = json['serialization'];
    typeField = json['type_field'];
    value = json['value'];
  }
}

class UserEmergencyContact {
  int active;
  String firstName;
  String lastName;
  String mail;
  String md5IdEmergencyContact;
  String mobile;
  String relation;
  String tel;

  UserEmergencyContact(
      {this.active,
      this.firstName,
      this.lastName,
      this.mail,
      this.md5IdEmergencyContact,
      this.mobile,
      this.relation,
      this.tel});

  UserEmergencyContact.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    mail = json['mail'];
    md5IdEmergencyContact = json['md5_id_emergency_contact'];
    mobile = json['mobile'];
    relation = json['relation'];
    tel = json['tel'];
  }
}

class UserMembers {
  int active;
  Address addres;
  String birthDate;
  String firstName;
  int idMember;
  String lastName;
  String libelleRelation;
  String mail;
  String mobile;
  String orientation;
  String registrationDate;
  int relationId;

  UserMembers(
      {this.active,
      this.addres,
      this.birthDate,
      this.firstName,
      this.idMember,
      this.lastName,
      this.libelleRelation,
      this.mail,
      this.mobile,
      this.orientation,
      this.registrationDate,
      this.relationId});

  UserMembers.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    addres =
        json['addres'] != null ? new Address.fromJson(json['addres']) : null;
    birthDate = json['birth_date'];
    firstName = json['first_name'];
    idMember = json['id_member'];
    lastName = json['last_name'];
    libelleRelation = json['libelle_relation'];
    mail = json['mail'];
    mobile = json['mobile'];
    orientation = json['orientation'];
    registrationDate = json['registration_date'];
    relationId = json['relation_id'];
  }
}

class UserRelation {
  int active;
  Address addres;
  Null birthDate;
  String codeLanguage;
  String expirePassword;
  String firstName;
  int idLanguage;
  int idRole;
  int idUser;
  String idSession;
  String lastName;
  String lastUpdate;
  Null lastUpdatePwd;
  String libelleRelation;
  String mail;
  String mail2;
  String mobile;
  String mobile2;
  String orientation;
  String registrationDate;
  int relationId;

  UserRelation(
      {this.active,
      this.addres,
      this.birthDate,
      this.codeLanguage,
      this.expirePassword,
      this.firstName,
      this.idLanguage,
      this.idRole,
      this.idUser,
      this.idSession,
      this.lastName,
      this.lastUpdate,
      this.lastUpdatePwd,
      this.libelleRelation,
      this.mail,
      this.mail2,
      this.mobile,
      this.mobile2,
      this.orientation,
      this.registrationDate,
      this.relationId});

  UserRelation.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    addres =
        json['addres'] != null ? new Address.fromJson(json['addres']) : null;
    birthDate = json['birth_date'];
    codeLanguage = json['code_language'];
    expirePassword = json['expire_password'];
    firstName = json['first_name'];
    idLanguage = json['id_language'];
    idRole = json['id_role'];
    idUser = json['id_user'];
    idSession = json['idSession'];
    lastName = json['last_name'];
    lastUpdate = json['last_update'];
    lastUpdatePwd = json['last_update_pwd'];
    libelleRelation = json['libelle_relation'];
    mail = json['mail'];
    mail2 = json['mail2'];
    mobile = json['mobile'];
    mobile2 = json['mobile2'];
    orientation = json['orientation'];
    registrationDate = json['registration_date'];
    relationId = json['relation_id'];
  }
}

class Addres {
  Null additionalAdress;
  Null countryLabel;
  Null cp;
  Null depName;
  String geom;
  String latt;
  String lng;
  Null regionName;
  Null stateLabel;
  Null streetName;

  Addres(
      {this.additionalAdress,
      this.countryLabel,
      this.cp,
      this.depName,
      this.geom,
      this.latt,
      this.lng,
      this.regionName,
      this.stateLabel,
      this.streetName});

  Addres.fromJson(Map<String, dynamic> json) {
    additionalAdress = json['additional_adress'];
    countryLabel = json['country_label'];
    cp = json['cp'];
    depName = json['dep_name'];
    geom = json['geom'];
    latt = json['latt'];
    lng = json['lng'];
    regionName = json['region_name'];
    stateLabel = json['state_label'];
    streetName = json['street_name'];
  }
}

class UserTags {
  String sN;
  int active;
  Null archive;
  String categorieLabel;
  String custumMessage;
  String dateActivation;
  int emergency;
  String finderWebsiteUrl;
  int idDictionnaryCategorie;
  int idDictionnaryCustumMessage;
  int idDictionnaryStatus;
  int idFinderWebsite;
  int idLabel;
  int idMember;
  Null idParent;
  int idTagCategorie;
  int idTagStatus;
  String label;
  String labelStaus;
  String lastUpdate;
  int masterTag;
  String rewardSum;
  List<Null> tagEmergencyContats;

  UserTags(
      {this.sN,
      this.active,
      this.archive,
      this.categorieLabel,
      this.custumMessage,
      this.dateActivation,
      this.emergency,
      this.finderWebsiteUrl,
      this.idDictionnaryCategorie,
      this.idDictionnaryCustumMessage,
      this.idDictionnaryStatus,
      this.idFinderWebsite,
      this.idLabel,
      this.idMember,
      this.idParent,
      this.idTagCategorie,
      this.idTagStatus,
      this.label,
      this.labelStaus,
      this.lastUpdate,
      this.masterTag,
      this.rewardSum,
      this.tagEmergencyContats});

  UserTags.fromJson(Map<String, dynamic> json) {
    sN = json['SN'];
    active = json['active'];
    archive = json['archive'];
    categorieLabel = json['categorie_label'];
    custumMessage = json['custum_message'];
    dateActivation = json['date_activation'];
    emergency = json['emergency'];
    finderWebsiteUrl = json['finder_website_url'];
    idDictionnaryCategorie = json['id_dictionnary_categorie'];
    idDictionnaryCustumMessage = json['id_dictionnary_custum_message'];
    idDictionnaryStatus = json['id_dictionnary_status'];
    idFinderWebsite = json['id_finder_website'];
    idLabel = json['id_label'];
    idMember = json['id_member'];
    idParent = json['id_parent'];
    idTagCategorie = json['id_tag_categorie'];
    idTagStatus = json['id_tag_status'];
    label = json['label'];
    labelStaus = json['label_staus'];
    lastUpdate = json['last_update'];
    masterTag = json['master_tag'];
    rewardSum = json['reward_sum'];
  }
}
