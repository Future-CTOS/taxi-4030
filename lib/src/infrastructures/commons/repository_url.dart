class RepositoryUrls {
  /// Authentication
  static const String logIn = '/auth/register-with-mobile';
  // static const String checkEmailExistence = '/account/is-email-exists';
  // static const String logout = '/auth/logout';
  //
  // /// Profile page
  // static String getOthersProfileInfo(final String id) =>
  //     '/account/find-one/account-id/$id';
  // static const String getProfileInfo = '/account/current';
  // static const String editProfile = '/account/edit-profile';
  //
  // static const String addVideoLink = '/account/upload-videoLink/';
  //
  // /// Teams
  // static String getTeams(
  //   final String id,
  // ) =>
  //     '/team/get-teams/$id';
  //
  // static String getCoachTeams(
  //   final String id,
  // ) =>
  //     '/team/get-coach-teams/$id';
  //
  // static String getAthleteTeams(
  //   final String id,
  // ) =>
  //     '/team/get-athlete-teams/$id';
  //
  // static String followUser(final String id) =>
  //     '/account-follow/follow/follow-id/$id';
  //
  // static String unfollowUser(final String id) =>
  //     '/account-follow/unfollow/follow-id/$id';
  //
  // /// Home page
  // static const String getPosts = '/post/find-all';
  //
  // static String likePost(final String id) => '/post/like/post-id/$id';
  //
  // /// Followers
  // static const String getFollowers = '/account-follow/get-followers';
  //
  // static String unfollow(final String id) =>
  //     '/account-follow/unfollow/follow-id/$id';
  //
  // /// Followings
  // static const String getFollowings = '/account-follow/get-followings';
  //
  // /// commons
  // static const String getSportsName = '/common/find-all-sports';
  // static const String getLevels = '/common/find-all-level';
  // static const String getPositions = '/common/find-all-positions';
  //
  static String getImage({
    required String folder,
    required String image,
  }) =>
      '`/account/uploaded-image/$folder/$image';
  //
  // /// comments
  // static String getComments({required String postId}) =>
  //     '/comment/find-all/post-id/$postId';
  //
  // static String postComment({required String postId}) =>
  //     '/comment/create/post-id/$postId';
  //
  // static String postCommentReply({required String commentId}) =>
  //     '/comment/reply/comment-id/$commentId';
  //
  // static String likeComment({required String commentId}) =>
  //     '/comment/like/comment-id/$commentId';
  //
  // /// Search Page
  // static const String getSearchResult = '/account/search';
  //
  // /// Posts
  // static const String postMedia = '/post/create';
  //
  // /// Other
  // static const String contactUs = '/contact/send-email-to-us';
  //
  // /// Team
  // static String getTeamMembers(final String teamId) =>
  //     '/team/find-team-member/$teamId';
  //
  // static const String addTeam = '/team/create';
  //
  // static String editTeam(final String teamId) =>
  //     '/team/update-current-team/$teamId';
  //
  // static String sendRequest(
  //   final String teamId,
  //   final String inviteeId,
  // ) =>
  //     '/team/send-request/$teamId/$inviteeId';
  //
  // static String moveTeamToNewSeason(final String teamId) =>
  //     '/team/move-team-to-new-season/$teamId';
  //
  // /// Notifications
  // static const String getPendingTeams = '/team/pending';
  //
  // /// Chat
  // static String getAllChats(final String sender) =>
  //     '/messages-socket/receiver/$sender';
  //
  // static String getConversation({
  //   required String sender,
  //   required String receiver,
  // }) =>
  //     '/messages-socket/conversation/$sender/$receiver';
  //
  // static String chatSocketUri() => '/socket.io/';
}
