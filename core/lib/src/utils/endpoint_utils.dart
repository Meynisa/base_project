import '../../core.dart';

class Endpoint {
  static final String baseUrl = FlavorConfig.instance!.values.baseUrl;
  static final String baseUrlDev = 'https://api-beta.ripple10.com/api/v2';//'https://apiv2.r10.co/api/v2';
  static final String baseUrlStage =
      'https://api.ripple10.com/api/v2'; //'http://159.65.10.9:9999/api/v2';
  static final String baseUrlProd = 'https://api.ripple10.com/api/v2';
  static final String baseUrlBeta = 'https://api-beta.ripple10.com/api/v2';

  static final String notifUrl = FlavorConfig.instance!.values.notifUrl;
  static final String notifUrlDev = 'https://push.r10.co';
  static final String notifUrlStage = 'https://push.r10.co';
  static final String notifUrlProd = 'https://push.ripple10.com';
  static final String notifUrlBeta = 'https://push.r10.co';

  static final String requestDemoUrl =
      "https://ivosights.com/contact-us?interest_in%5B0%5D=ripple10&utm_source=ripple10-mobile&utm_medium=mobile-app&utm_campaign=ripple10-mobile-contact&utm_id=ripple10-mobile-contact";

  static final String login = '/auth/login';
  static final String profile = '/profile/global-settings/get-profile';
  static final String changePassword = '/auth/changepassword';

  static final String sentimentCount = '/mentions/sentiment-count';
  static final String mentions = '/mentions';
  static final String shareOfStream = '/stream/shareofstream';
  static final String shareOfVoice = '/stream/share-of-voice';
  static final String healthIndex = '/health';
  static final String healthSentiment = '/health/sentiment';
  static final String mentionsComposition = '/mentions/composition';
  static final String hashtag = '/mentions/hashtags';
  static final String wordcloud = '/mentions/wordcloud';
  static final String topInfluencer = '/mentions/top_influencer';
  static final String topUsers = '/mentions/top_users';
  static final String trendingTwitter = '/trendings/twitter/';
  static final String trendingGoogle = '/trendings/google/';
  static final String stream = '/stream';
  static final String summaryTwitter = '/summary/twitter';
  static final String averageMentions = '/mentions/average-daily-mentions';
  static final String streamBrandMentions = '/stream/brand/mention';
  static final String summaryByBrand = '/summary/bybrand';
  static final String mediaDistribution = '/mentions/media-distribution';
  static final String registerDevice = '/notif/register';
  static final String unregisteredDevice = '/notif/unregister';
  static final String heartbeat = '/notif/heartbeat';
  static final String survey = '/survey';
  static final String potentialReach = '/summary/potential-reach';

  static final String collectData = '/demo-request-mobile';

  static final String genderOfStream = '/stream/totalgenderofstream';
}
