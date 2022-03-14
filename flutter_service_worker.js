'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
<<<<<<< HEAD
  "assets/AssetManifest.json": "398d79c4145bbc6aea57359fb1926619",
=======
  ".git/COMMIT_EDITMSG": "6384a4d6c550ca1cc2dc042d94395529",
".git/config": "06aa3801f9740ff22fdaf2339fff3055",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "ea587b0fae70333bce92257152996e70",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "4245d3219f4e507b64ecca8253041318",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "0b86ae40dfd1a495c7f13c11ac4d73c7",
".git/logs/refs/heads/main": "5e9b6edf536e2d41a89c186360b87e95",
".git/logs/refs/remotes/origin/main": "4763ccda6748523cd70800807853ac03",
".git/objects/00/5ae8a029012eac12a17ec8aa91eb920ec1d8a2": "f0df17d22ca1d61550e63c7da5096480",
".git/objects/0c/3cad011bde658393c823a497e4cbc520526022": "6c9e96b330a84db69c1435ec82f2bee4",
".git/objects/0d/1e0ace4005bbd19ef047447bdab4a800e5ff58": "5b061da372d6b9a57f347b7c52f935d9",
".git/objects/1f/210f568e820a0b04646e03ac445b53bd31dcf8": "cdfb84e5ea33a13295e8b1694e00515d",
".git/objects/22/1e0174e2c48b7b052c33dfcaae7e2505bce818": "f5a9e776e8a138e5a90afab5d48fe3b5",
".git/objects/2a/6a65bef605476d76a897511f0f38d7b6ec716c": "26537f40492df9208fad37211e4624a5",
".git/objects/2e/b9a344696d0c676aa16d44a3dd6b612800e73b": "3cea6cf8ab182c011b116b9c313c57fc",
".git/objects/32/46ad559eeae0370195978eaed83f1053ee13fd": "a043dbc0a0bda96ce2127799ccc27506",
".git/objects/38/aea6049967e9b37b1d86f153c345f25c04808a": "17d3ba5d33f43cc889273c0d1d21e5d1",
".git/objects/3a/e140da375887975dc2eb04287e93529c7cf659": "2e79dd919849e30a0f82214319632a1b",
".git/objects/3e/432a152179956cfe12e2950b8ff174b71cc83e": "826b5cc9c80202498cefa215496978b0",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/49/da30a72c97ae5c6687719b939bac875162acef": "b21730ec9adc18838258c8682fc639b0",
".git/objects/4d/2e362d8ce2a1b3b0bae7d38510a263fe31f1f1": "1a3e6411e659ef213ecfc8d006423a22",
".git/objects/51/c42894a7b4aad04f4afff2a42c1472728d7635": "c1400d6fd4e2df6e3087fe9a1e73bc1c",
".git/objects/55/209bea8584c7aefb9f38e997853b9a0718202a": "cd9a92a65c79cebfd3f4b384357fba20",
".git/objects/61/68e78ee465caf267ba79055414ab8a1d782e65": "43d7d29a4e491d8c9a45d9b5b1fd397c",
".git/objects/65/647fb5bcca55e208cb176be85c26cdd9315dc2": "1d19117857b7683440941fd0eeede76f",
".git/objects/6f/6a43b1832f3090f7a433d6bfc086af3c75b007": "b71a29f660022ccf2fabefd97f75144b",
".git/objects/70/9bc51997f117b26f5834748f4dfa128a53c732": "5f70a018eb3a4481b2701baa24e3890e",
".git/objects/75/8fd5d031dcaf183fdead0c832dd047bd9d93fc": "ac69b5916476df73e5b8a2adeff851dd",
".git/objects/76/07bf19e98cef3b57a1c59cf57cae37084ddbb2": "9f0a4741281dcae1203d7a20c3767aa5",
".git/objects/76/c30e4be50d1e7d06d085365280eae955042faa": "a9bb581ad904e32cc073502be76205fd",
".git/objects/79/ba7ea0836b93b3f178067bcd0a0945dbc26b3f": "f3e31aec622d6cf63f619aa3a6023103",
".git/objects/7f/48f43f7407c0bbbd7109a6e5a835335e97c5bc": "5bd984db7b82c833307377a331e11717",
".git/objects/87/748811d9bdbffffa46bb959351dcefc851eef9": "f6ae000509c1c6189205c1dffee84fb3",
".git/objects/87/f054e04ed114946a8053f1e1af75ae02515ad8": "5564957db507df4c078a0fee4df56451",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8e/8bbc38029823f16502cb1ad99d9f8d7bb709f5": "e8b547ab1bf4375eb7ea90dc1abe8607",
".git/objects/8f/2e9a84816a85383c6747e3a09073475db39683": "7da20faa84b506a2565df2b2e0ce9b5a",
".git/objects/95/9a9de74d637e330fe188c892db2fa160abfb5b": "f9705c1e89f93a3ef1f598aa7cdc26cd",
".git/objects/96/39b1be6de341edcf8b32ffa0a1c09155f52c48": "19be8293b77ef81e6b1e5c75ea6b834c",
".git/objects/9b/38fd5936e03567c5e670460e8eacaaa5a3afef": "3dfe01af29f322d464c9ad690984b0a3",
".git/objects/9d/fe8d8b50f27f6b62c4d09cd20243e16c8d4e2b": "90a8a6d35280e2343040d119ceeaacac",
".git/objects/a1/3837a12450aceaa5c8e807c32e781831d67a8f": "bfe4910ea01eb3d69e9520c3b42a0adf",
".git/objects/a4/84d429617e1a821fbf20ea65eab16903590be4": "4c4f40ef18070f0e7e1c150fe407d1c1",
".git/objects/a8/beffd3ad4fe54d6cabccf83a05477d6a986cd0": "6677888e4a051c7838b5b240c09f0981",
".git/objects/ab/0e98497a51ead7821d1da35a24968ff314e50f": "557c35fe3928eb2af403d1b3926bb9ba",
".git/objects/ae/1cccc7ca6ebf26b1e4104baba791f1ee278785": "d6c9a4268f64077e9f6637d2afce5d73",
".git/objects/af/3bf31084fbcb86d5889e0a239c4c6dcaf46f77": "76f6b6d2ea9450ccd4d4126f83acd971",
".git/objects/b1/8248f57ba7b04999ca647f4d9eb36cd9c7ec22": "fe16233517bf5c12f7361889632b4075",
".git/objects/b4/d0305ae0fd955867320794fdea54681d2f1743": "0bcd41ea6c841f3687383243ecda5cef",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/c6/752760e7099bafd563eac460f438e781468a74": "4b4ed6a471e7c9a790e71a22a8c541b8",
".git/objects/cc/2000d30de8c7d4a96ab101e954e335dc8fdb03": "bb1047348778e2b85f82f1ed6ef8cc30",
".git/objects/cd/5c487388b659c431bd9830c2211c867708a92e": "432a27f1ec7f8b3e3ec44bc3712aee30",
".git/objects/d5/6b86dbe80a5e4636b91ac581677a8a35e0b6f3": "cb9d255de9949e4f9340f2847661e81e",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/db/3b94d244a66ca7fec3426843fae0c90d545bde": "a8aa486cab4647054edfc1326918e0f6",
".git/objects/de/1bc30a1e52113f16f7694caae830281ba60ae6": "ed0f8861e6704277afe3931ef180c699",
".git/objects/e2/b0a201212b011dc1ada551471c40cbb3a46c98": "3356c77b8882a27c8b576b93acbf7abe",
".git/objects/e5/951dfb943474a56e611d9923405cd06c2dd28d": "c6fa51103d8db5478e1a43a661f6c68d",
".git/objects/e9/9b468cc686aa55c5c37faed8227afeaea9b52d": "85d759c839e26118faadb778340a8586",
".git/objects/e9/e4b72ec9b078af73b0faa9ecef5fd653f503d1": "53366d23781a1ff001859ce5d7c1a62f",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ef/af1af2b97874b243a9a890c21ee6052e456640": "23882f43084f3ad7149753eb1f353cce",
".git/objects/f3/d2e6c9bdb99f6973ccfa88b00d1fe23b6d8cfb": "e903ad154e40697aaca3e1f4f751b1ef",
".git/objects/f7/d064cb525833161024008be95e86329dfe4453": "e852ec215f3641d2b285b1c351d513e6",
".git/refs/heads/main": "2e9b6eee6cfe512b1f090171bc535302",
".git/refs/remotes/origin/main": "2e9b6eee6cfe512b1f090171bc535302",
"assets/AssetManifest.json": "398d79c4145bbc6aea57359fb1926619",
>>>>>>> a7d2a4acff7a4b5936738a38ac191c8372460ec0
"assets/assets/images/custom/1blue.png": "0d11f20efc6570a048f7fdaaaf91fb01",
"assets/assets/images/custom/2green.png": "56aabe4c6f02f0000fb00cf8d7a93544",
"assets/assets/images/custom/3yellow.png": "8529c74259d6963491ceda3a82a8df30",
"assets/assets/images/custom/4flutter_dash.png": "00dd096e5baa43aca04bde83c5a32394",
"assets/assets/images/custom/dash.jpg": "b6995185cbf6077b24ed0f6a43388502",
"assets/assets/images/flutter-logo.jpg": "36f02becd11822ef436ccc8c285f0f4b",
"assets/assets/images/logo_flutter_color.png": "496548be6768a0945cafe0cf7c12b389",
"assets/assets/images/logo_flutter_white.png": "fe99d806f7819c9ef2d2c9a1dc350693",
"assets/assets/images/simple_dash_small.png": "b3f2ec92db7be8297f529f94d8e38136",
"assets/assets/images/timer_icon.png": "284049eb59c25888ebe6ecf864728727",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "13fb1915d7ce3366dc9dfcfb5c0b0be4",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"canvaskit/canvaskit.js": "62b9906717d7215a6ff4cc24efbd1b5c",
"canvaskit/canvaskit.wasm": "b179ba02b7a9f61ebc108f82c5a1ecdb",
"canvaskit/profiling/canvaskit.js": "3783918f48ef691e230156c251169480",
"canvaskit/profiling/canvaskit.wasm": "6d1b0fc1ec88c3110db88caa3393c580",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
<<<<<<< HEAD
"index.html": "7004a43416f7306b50ac1ec7a4b3481a",
"/": "7004a43416f7306b50ac1ec7a4b3481a",
"main.dart.js": "94d76a0aa9286d2406a355ac991463b7",
=======
"index.html": "e4e7b7dd0bdb94902899720c34944243",
"/": "e4e7b7dd0bdb94902899720c34944243",
"main.dart.js": "7f7b7ab3f9d6af29f9e94d0faffd9b22",
>>>>>>> a7d2a4acff7a4b5936738a38ac191c8372460ec0
"manifest.json": "6149393b748cf4b340f9a0e675137d15",
"styles.css": "0008c03ef4446965a69cf28bd50b6ecb",
"version.json": "4dc565fc8c0072909da6272bab89ae63"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
