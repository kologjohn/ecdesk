'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "da3fcc3d4aa6bb2194d7e7e36d817d16",
"assets/AssetManifest.bin.json": "664380398cda9f00df2d42560b281b16",
"assets/AssetManifest.json": "090f83916ddce42eae035cc1f772ca50",
"assets/assets/images/0.png": "9d533b20c2cd75981cf40c971587aa10",
"assets/assets/images/1567500079.png": "83e4f4fe0ccb6dab542cd3f1c88b5aec",
"assets/assets/images/CoA.png": "3faea2c1037024b4161b72d430c105fd",
"assets/assets/images/flag.png": "ee5ff1e1f459e02e2cb43a4ee0e1fa06",
"assets/assets/images/floating.png": "3a6d2d7bcf38225eacf874e7bf870b0a",
"assets/assets/images/male.png": "12a73387089ee5795e1dfb14d1d0390c",
"assets/assets/images/map.svg": "d231e44b737e4940ecccf0173b1b7585",
"assets/assets/images/NDC-L.png": "357ca0b817ace843159c634e97c9431e",
"assets/assets/images/ndc.jpg": "8b2a0d2268bb809a09f92bd7360bc87e",
"assets/assets/images/ndc.png": "8a73a294937003c7a073afe096fc15ca",
"assets/assets/images/ndc1.png": "e5a1d35ea9dc187f9ed21de5340688f0",
"assets/assets/images/ndc2.png": "2dc10c2156affdd6110f45f0c3165737",
"assets/assets/images/ndc3.png": "91b14ca256f1512d4290a35c61c760d6",
"assets/assets/images/npp.jpg": "293115b3a98ce627ddff81d1f5bb3bcb",
"assets/assets/images/npp.png": "1e845f99cb10d2d29389aa5d6e9f05d9",
"assets/assets/images/others.png": "8438fc0d2fe7e76896aa6f8c61701efa",
"assets/assets/images/passport.png": "19c5c38fc5cdc2e719aa72e94b56673b",
"assets/assets/images/profile.jpg": "366a34167c509c1ebb401912e62815c2",
"assets/assets/images/QRcode.png": "bd3876c5976e71a5e9ef0d2b31b6f4c8",
"assets/assets/images/total.svg": "52ea1752ddb827e464e3f6323d0844d2",
"assets/assets/svgs/female.svg": "777f142dd41d11f8e8bb8c88347f8b35",
"assets/assets/svgs/male.svg": "f6656478a37749ffb5c7ab4af57de9ba",
"assets/assets/svgs/map.svg": "d41d8cd98f00b204e9800998ecf8427e",
"assets/assets/svgs/profile.svg": "4f67021ec3aa91703dfe9123f83780ce",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "06955c702263af7351b4a52d26610fc6",
"assets/NOTICES": "cf341db0737b0b154e169641efb48067",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "b67fc5557acfca48307fa133cca472ad",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/logo.png": "6846aa446da6010131d8f627cf373662",
"icons5e73b4b8": "ac9a721a12bbc803b44f645561ecb1e1",
"iconsa35cfc07": "96e752610906ba2a93c65f8abe1645f1",
"iconsb4c3567f": "ac9a721a12bbc803b44f645561ecb1e1",
"index.html": "6ee8613d6370819aca599785d699ddba",
"/": "6ee8613d6370819aca599785d699ddba",
"main.dart.js": "f0d6523ac38f92873bbca84b23f2fe7a",
"manifest.json": "9c7e813e86bfa4cd592794c78f18a50c",
"version.json": "3d7fdd38b51b53d0ec85f74341a4c737"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
