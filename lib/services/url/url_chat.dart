import 'url.dart';

final baseUrl = host + '/egt-chat-service/api/v1/' + companyId.toString() + '/forward';
final baseUrlLogin = host + '/egt-chat-service/api/v1/' + companyId.toString() + '/login';
final socketRocketUrl = 'wss://egt.vn:3000/websocket';
final rocketChatHostUrl = 'https://egt.vn:3000';
// login api
final authen = {
  "api" : "/login",
  "typeApi" : "post",
};

// logout api
final logout = {
  "api" : "/logout",
  "typeApi" : "post",
};

// create new user
final createUser = {
  "api" : "/users.create",
  "typeApi" : "post",
};

// fetch list group
final listGroup = {
  "api" : "/groups.list",
  "typeApi" : "get",
};

// create group
final createGroup = {
  "api" : "/groups.create",
  "typeApi" : "post",
};

// fetch member of a group
final getMemberOfGroup = {
  "api" : "/groups.members",
  "typeApi" : "get",
};

// invite member to a group
final inviteMemberToGroup = {
  "api" : "/groups.invite",
  "typeApi" : "post",
};

// create discusstion
final createDiscussion = {
  "api" : "/rooms.createDiscussion",
  "typeApi" : "post",
};

// fetch discusstion
final getDiscussion = {
  "api" : "/rooms.getDiscussions",
  "typeApi" : "post",
};

// make message readed
final getMessages = {
  "api" : "/method.call/readMessages",
  "typeApi" : "post",
};

// get message history
final fetchMessagesHistory= {
  "api" : "/method.call/loadHistory",
  "typeApi" : "post",
};

// upload file
final uploadFile = {
  "api" : "/rooms.upload/",
  "typeApi" : "post",
};