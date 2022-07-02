import 'package:portfolio_website1/models/contacts_model.dart';

class ContactsController{

  List<ContactsModel> contactsList = [
    ContactsModel(platformName: 'LinkedIn', scheme: 'https', platformLogoLink: 'images/linkedin_logo.png', contactUrl: 'www.linkedin.com/in/mohammad-asim-junaid-07224517b/'),
    ContactsModel(platformName: 'Mail', scheme: 'mailto', platformLogoLink: 'images/gmail_logo.png', contactUrl: "asimjunaid048@gmail.com"),
    ContactsModel(platformName: 'Github', scheme: 'https', platformLogoLink: 'images/github_logo.png', contactUrl: 'www.github.com/AwsmAsim'),
    ContactsModel(platformName: 'Hashnode', scheme: 'https', platformLogoLink: 'images/hashnode_logo.png', contactUrl: 'asimjunaidcodes.hashnode.dev/'),
    ContactsModel(platformName: 'Leetcode', scheme: 'https', platformLogoLink: 'images/leetcode_logo.png', contactUrl: 'www.leetcode.com/AwsmAsim/')

  ];

}

//https://leetcode.com/AwsmAsim/