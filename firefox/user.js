// https://github.com/pyllyukko/user.js
// https://github.com/drduh/config/blob/master/firefox.user.js
// https://github.com/ghacksuserjs/ghacks-user.js

user_pref("accessibility.force_disabled", 1);
// user_pref("accessibility.typeaheadfind.flashBar", 0);
user_pref("app.shield.optoutstudies.enabled", false);  // disable studies
user_pref("app.update.enabled", true);
user_pref("app.feedback.baseURL", "");
user_pref("app.normandy.api_url", "");
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.first_run", false);
user_pref("app.support.baseURL", "");
user_pref("beacon.enabled", false);
user_pref("breakpad.reportURL", "");
user_pref("browser.aboutHomeSnippets.updateUrl", "");
user_pref("browser.bookmarks.max_backups", 0);
user_pref("browser.casting.enabled", false);
user_pref("browser.chrome.errorReporter.enabled", false);
user_pref("browser.chrome.errorReporter.submitUrl", "");
user_pref("browser.contentblocking.rejecttrackers.reportBreakage.enabled", false);
user_pref("browser.contentblocking.reportBreakage.enabled", false);
user_pref("browser.contentblocking.reportBreakage.url", "");
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);
user_pref("browser.ctrlTab.migrated", true);
user_pref("browser.ctrlTab.recentlyUsedOrder", false);
user_pref("browser.discovery.enabled", false);
user_pref("browser.download.manager.retention", 0);
user_pref("browser.download.animateNotifications", false);
user_pref("browser.download.autoHideButton", false);
user_pref("browser.fixup.alternate.enabled", false);
user_pref("browser.fixup.hide_user_pass", true);
user_pref("browser.formfill.enable", false);
user_pref("browser.library.activity-stream.enabled", false);
user_pref("browser.newtabpage.activity-stream.default.sites", "");
user_pref("browser.newtabpage.activity-stream.disableSnippets", true);
user_pref("browser.newtabpage.activity-stream.enabled", false);
user_pref("browser.newtabpage.activity-stream.feeds.discoverystreamfeed", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.highlights", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref("browser.newtabpage.activity-stream.feeds.snippets", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.newtabpage.activity-stream.prerender", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeBookmarks", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeDownloads", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeVisited", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry.ping.endpoint", "");
user_pref("browser.newtabpage.activity-stream.tippyTop.service.endpoint", "");
user_pref("browser.newtabpage.enhanced", false);
user_pref("browser.newtab.preload", false);
user_pref("browser.newtabpage.directory.ping", "");
user_pref("browser.newtabpage.directory.source", "data:text/plain,{}");
user_pref("browser.newtabpage.remote", false);
user_pref("browser.newtabpage.storageVersion", 1);
user_pref("browser.pagethumbnails.capturing_disabled", true);
user_pref("browser.ping-centre.telemetry", false);
user_pref("browser.ping-centre.production.endpoint", "");
user_pref("browser.ping-centre.staging.endpoint", "");
user_pref("browser.preferences.defaultPerformanceSettings.enabled", false);
user_pref("browser.privatebrowsing.forceMediaMemoryCache", true);
user_pref("browser.region.network.url", "");
user_pref("browser.region.update.enabled", false);
user_pref("browser.safebrowsing.downloads.enabled", false);
user_pref("browser.safebrowsing.downloads.remote.enabled", false);
user_pref("browser.safebrowsing.downloads.remote.url", "");
user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("browser.safebrowsing.phishing.enabled", false);
user_pref("browser.search.countryCode", "US");
user_pref("browser.search.region", "US");
user_pref("browser.search.geoSpecificDefaults", false);
user_pref("browser.search.geoSpecificDefaults.url", "");
user_pref("browser.search.geoip.url", "");
user_pref("browser.search.update", false);
user_pref("browser.search.hiddenOneOffs", "Bing,eBay,Facebook");  // disable search providers
user_pref("browser.selfsupport.url", "");
user_pref("browser.sessionstore.privacy_level", 2);  // disable session restore
user_pref("browser.sessionstore.resume_from_crash", false);
user_pref("browser.send_pings", false);
user_pref("browser.send_pings.require_same_host", true);
user_pref("browser.shell.checkDefaultBrowser", false);
user_pref("browser.ssl_override_behavior", 1);
user_pref("browser.startup.homepage_override.buildID", "20120101");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.tabs.extraDragSpace", true);
user_pref("browser.tabs.warnOnClose", false);
user_pref("browser.tabs.warnOnCloseOtherTabs", false);
user_pref("browser.tabs.warnOnOpen", false);
user_pref("browser.uitour.enabled", false);
user_pref("browser.uitour.url", "");
user_pref("browser.urlbar.dnsResolveSingleWordsAfterSearch", 0);
user_pref("browser.urlbar.speculativeConnect.enabled", false);
user_pref("browser.urlbar.suggest.openpage", false);
user_pref("browser.urlbar.trimURLs", false);
user_pref("browser.urlbar.filter.javascript", true);
user_pref("browser.xul.error_pages.expert_bad_cert", true);
user_pref("camera.control.face_detection.enabled", false);
user_pref("canvas.capturestream.enabled", false);  // disable canvas capture stream
user_pref("captivedetect.canonicalURL", "");  // disable captive portal helper
user_pref("clipboard.autocopy", false);
user_pref("datareporting.healthreport.infoURL", "");
user_pref("datareporting.healthreport.service.enabled", false);
user_pref("datareporting.healthreport.service.firstRun", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("device.sensors.enabled", false);
user_pref("devtools.cache.disabled", true);
user_pref("devtools.dom.enabled", true);
user_pref("devtools.onboarding.telemetry.logged", false);
user_pref("devtools.debugger.remote-enabled", false);
user_pref("devtools.debugger.force-local", true);
user_pref("devtools.chrome.enabled", false);
user_pref("devtools.webide.autoinstallADBExtension", false);
user_pref("devtools.webide.autoinstallADBHelper", false);
user_pref("devtools.webide.autoinstallFxdtAdapters", false);
user_pref("devtools.webide.enabled", false);
// user_pref("dom.allow_cut_copy", false);
user_pref("dom.battery.enabled", false);
user_pref("dom.caches.enabled", false);  // disable service workers cache
user_pref("dom.disable_beforeunload", true);
user_pref("dom.disable_open_during_load", true);
user_pref("dom.disable_window_move_resize", true);
user_pref("dom.enable_performance", false);
user_pref("dom.enable_performance_navigation_timing", false);
user_pref("dom.enable_performance_observer", false);
user_pref("dom.enable_resource_timing", false);
// user_pref("dom.event.clipboardevents.enabled", false);
user_pref("dom.event.contextmenu.enabled", false);
user_pref("dom.flyweb.enabled", false);  // disable local discovery
user_pref("dom.gamepad.enabled", false);  // disable USB enumeration
user_pref("dom.imagecapture.enabled", false);  // disable camera image capture
user_pref("dom.ipc.plugins.flash.subprocess.crashreporter.enabled", false);
user_pref("dom.ipc.plugins.reportCrashURL", false);
// user_pref("dom.maxHardwareConcurrency", 2);
user_pref("dom.mozTCPSocket.enabled", false);
user_pref("dom.netinfo.enabled", false);
user_pref("dom.push.connection.enabled", false);
user_pref("dom.push.enabled", false);
user_pref("dom.push.serverURL", "");
user_pref("dom.push.userAgentID", "");
user_pref("dom.security.https_only_mode", true);
user_pref("dom.security.https_only_mode_send_http_background_request", false);
user_pref("dom.serviceWorkers.enabled", false);
user_pref("dom.targetBlankNoOpener.enabled", true);
user_pref("dom.telephony.enabled", false);
user_pref("dom.vibrator.enabled", false);
user_pref("dom.vr.enabled", false);
user_pref("dom.vr.service.enabled", false);
user_pref("dom.webaudio.enabled", false);
user_pref("dom.webnotifications.enabled", false);
user_pref("dom.webnotifications.serviceworker.enabled", false);
user_pref("experiments.activeExperiment", false);
user_pref("experiments.enabled", false);
user_pref("experiments.manifest.uri", "");
user_pref("experiments.supported", false);
user_pref("extensions.blocklist.enabled", true);
user_pref("extensions.blocklist.url", "https://blocklist.addons.mozilla.org/blocklist/3/%APP_ID%/%APP_VERSION%/");
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("extensions.formautofill.available", "off");
user_pref("extensions.formautofill.creditCards.available", false);
user_pref("extensions.formautofill.creditCards.enabled", false);
user_pref("extensions.formautofill.heuristics.enabled", false);
user_pref("extensions.getAddons.showPane", false);
user_pref("extensions.getAddons.search.browseURL", "https://addons.mozilla.org/%LOCALE%/firefox/search?q=%TERMS%");
user_pref("extensions.getAddons.cache.enabled", false);
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
user_pref("extensions.pocket.api", "");
user_pref("extensions.pocket.enabled", false);
user_pref("extensions.pocket.oAuthConsumerKey", "");
user_pref("extensions.pocket.site", "");
user_pref("extensions.screenshots.disabled", true);
user_pref("extensions.screenshots.upload-disabled", true);
user_pref("extensions.shield-recipe-client.api_url", "");
user_pref("extensions.shield-recipe-client.enabled", false);
user_pref("extensions.ui.dictionary.hidden", true);
user_pref("extensions.ui.experiment.hidden", true);
user_pref("extensions.ui.locale.hidden", true);
user_pref("extensions.webcompat-reporter.enabled", false);  // disable web compatibility reporter
user_pref("extensions.webservice.discoverURL", "");
user_pref("findbar.highlightAll", true);
user_pref("findbar.modalHighlight", true);
user_pref("general.buildID.override", "20120101");
user_pref("general.warnOnAboutConfig", false);  // disable about:config warning
// user_pref("geo.enabled", false);  // no geo-location
// Mozilla geolocation service instead of Google:
user_pref("geo.provider.network.url", "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%");
user_pref("geo.provider.ms-windows-location", false);  // disable geo on windows
user_pref("geo.provider.use_corelocation", false);  // disable geo on mac
user_pref("geo.provider.use_gpsd", false);  // disable geo on linux
user_pref("geo.wifi.logging.enabled", false);
user_pref("geo.wifi.uri", "");
user_pref("intl.accept_languages", "en-US, en");
user_pref("intl.charset.fallback.override", "utf-8");
user_pref("intl.locale.requested", "en-US");
user_pref("intl.regional_prefs.use_os_locales", false);  // don't use OS to determine locale
user_pref("javascript.options.asmjs", false);
user_pref("javascript.options.shared_memory", false);  // disable shared memory
user_pref("javascript.options.wasm", false);
user_pref("javascript.use_us_english_locale", true);
// user_pref("keyword.enabled", false);  // do not submit invalid URLs to search engine
user_pref("layers.acceleration.force-enabled", true);
user_pref("layout.css.font-visibility.level", 1);
user_pref("lightweightThemes.persisted.footerURL", false);
user_pref("lightweightThemes.persisted.headerURL", false);
user_pref("lightweightThemes.update.enabled", false);  // disable themes auto updates
user_pref("loop.logDomains", false);  // disable more telemetry
user_pref("mathml.disabled", true);  // disable Mathematical Markup Language
user_pref("media.autoplay.default", 2);  // HTML5 media - 0: allow; 1: block; 2: prompt
user_pref("media.autoplay.default", 5);
user_pref("media.block-autoplay-until-in-foreground", true);  // disable auto-play in background tabs
user_pref("media.autoplay.ask-permission", true);
user_pref("media.autoplay.enabled.user-gestures-needed", true);
user_pref("media.autoplay.allow-muted", false);
user_pref("media.autoplay.block-webaudio", true);
user_pref("media.getusermedia.audiocapture.enabled", false);  // disable audio capture
user_pref("media.getusermedia.browser.enabled", false);  // disable WebRTC getUserMedia
user_pref("media.getusermedia.screensharing.enabled", false);  // disable screen-sharing
user_pref("media.gmp-gmpopenh264.enabled", false);
user_pref("media.gmp-manager.url", "");
user_pref("media.navigator.enabled", false);
user_pref("media.navigator.video.enabled", false);
user_pref("media.ondevicechange.enabled", false);
user_pref("media.peerconnection.enabled", false);
user_pref("media.peerconnection.ice.default_address_only", true);
user_pref("media.peerconnection.ice.no_host", true);
user_pref("media.peerconnection.ice.proxy_only", true);
user_pref("media.peerconnection.ice.tcp", false);
user_pref("media.peerconnection.identity.enabled", false);
user_pref("media.peerconnection.identity.timeout", 1);
user_pref("media.peerconnection.turn.disable", true);
user_pref("media.peerconnection.use_document_iceservers", false);
user_pref("media.peerconnection.video.enabled", false);
user_pref("media.video_stats.enabled", false);
user_pref("media.webspeech.recognition.enable", false);
user_pref("media.webspeech.synth.enabled", false);
user_pref("network.allow-experiments", false);
user_pref("network.auth.subresource-http-auth-allow", 1);
user_pref("network.captive-portal-service.enabled", false);
user_pref("network.connectivity-service.enabled", false);  // disable network connectivity checks
user_pref("network.connectivity-service.enabled", false);  // don't help with captive portals
user_pref("network.cookie.cookieBehavior", 1); // All third-party cookies
user_pref("network.cookie.thirdparty.nonsecureSessionOnly", true);
user_pref("network.cookie.thirdparty.sessionOnly", true);
user_pref("network.dns.blockDotOnion", true);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);
user_pref("network.file.disable_unc_paths", true);  // disable Uniform Naming Convention paths
user_pref("network.ftp.enabled", false);  // disable FTP
user_pref("network.gio.supported-protocols", "");  // disable Gvfs/GIO
user_pref("network.http.altsvc.enabled", false);  // disable HTTP Alternative Services
user_pref("network.http.altsvc.oe", false);
// referrer stuff was too strict before -- broke LOTS of crap:
user_pref("network.http.sendRefererHeader", 2);
user_pref("network.http.referer.XOriginPolicy", 1);
user_pref("network.http.referer.XOriginTrimmingPolicy", 0);
user_pref("network.http.referer.trimmingPolicy", 0);
user_pref("network.http.referer.spoofSource", false);
user_pref("network.http.speculative-parallel-limit", 0);
user_pref("network.IDN_show_punycode", true);
user_pref("network.manage-offline-status", false);
user_pref("network.negotiate-auth.allow-insecure-ntlm-v1", false);  // disable NTLMv1
user_pref("network.negotiate-auth.allow-insecure-ntlm-v1-https", false);  // disable all NTLM
user_pref("network.predictor.cleaned-up", true);
user_pref("network.predictor.enable-prefetch", false);  // disable prefetching
user_pref("network.predictor.enabled", false);  // disable "Necko" predictive service
user_pref("network.prefetch-next", false);
user_pref("network.stricttransportsecurity.preloadlist", true);  // preload HSTS
// DoH via Cloudflare:
user_pref("network.trr.mode", 2);
user_pref("network.trr.uri", "https://cloudflare-dns.com/dns-query");
user_pref("network.trr.custom_uri", "https://cloudflare-dns.com/dns-query");
user_pref("offline-apps.allow_by_default", false);
user_pref("pdfjs.enableScripting", false);
user_pref("pdfjs.enableWebGL", false);
user_pref("permissions.delegation.enabled", false);
// user_pref("plugin.state.flash", 0);
user_pref("plugin.state.java", 0);
user_pref("plugins.click_to_play", true);  // require plugin activation
user_pref("privacy.clearOnShutdown.offlineApps", true);
user_pref("privacy.clearOnShutdown.openWindows", true);
user_pref("privacy.cpd.offlineApps", true);
user_pref("privacy.cpd.cache", true);
user_pref("privacy.cpd.cookies", true);
user_pref("privacy.cpd.downloads", true);
user_pref("privacy.cpd.formdata", true);
user_pref("privacy.cpd.history", true);
user_pref("privacy.cpd.openWindows", true);
user_pref("privacy.cpd.passwords", true);
// user_pref("privacy.cpd.siteSettings", true);
user_pref("privacy.cpd.sessions", true);
user_pref("privacy.donottrackheader.enabled", true);
// user_pref("privacy.firstparty.isolate", true);       // breaks CAPTCHAs, way too annoying
// user_pref("privacy.resistFingerprinting", true);     // less breakage by using https://addons.mozilla.org/en-US/firefox/addon/canvasblocker/
user_pref("privacy.trackingprotection.cryptomining.enabled", true);
user_pref("privacy.trackingprotection.enabled", true);  // https://wiki.mozilla.org/Security/Tracking_protection
user_pref("privacy.trackingprotection.fingerprinting.enabled", true);
user_pref("privacy.trackingprotection.introCount", 20);
user_pref("privacy.trackingprotection.ui.enabled", true);
user_pref("privacy.userContext.enabled", true);
user_pref("privacy.userContext.longPressBehavior", 2);  // long-press on + tab button to open container menu
user_pref("privacy.userContext.ui.enabled", true);  // enable container tabs setting
user_pref("privacy.usercontext.about_newtab_segregation.enabled", true);
user_pref("reader.parse-on-load.enabled", false);
user_pref("security.cert_pinning.enforcement_level", 2);
user_pref("security.certerrors.recordEventTelemetry", false);
user_pref("security.csp.enable", true);
user_pref("security.csp.experimentalEnabled", true);
user_pref("security.data_uri.block_toplevel_data_uri_navigations", true);
user_pref("security.dialog_enable_delay", 0); // disable time before confirmation buttons can be clicked
user_pref("security.fileuri.strict_origin_policy", true);
user_pref("security.insecure_connection_icon.enabled", true);
user_pref("security.insecure_connection_text.enabled", true);
user_pref("security.insecure_field_warning.contextual.enabled", true);
user_pref("security.insecure_password.ui.enabled", true);  // warn on non-secure forms
// user_pref("security.mixed_content.block_display_content", true);         // breaks xfinity on demand
// user_pref("security.mixed_content.block_object_subrequest", true);       // breaks xfinity on demand
user_pref("security.OCSP.enabled", 1);
user_pref("security.OCSP.require", true);
user_pref("security.pki.sha1_enforcement_level", 1);
user_pref("security.sri.enable", true);
user_pref("security.ssl.disable_session_identifiers", true);
user_pref("security.ssl.enable_ocsp_stapling", true);
// user_pref("security.ssl.enable_ocsp_must_staple", true);
user_pref("security.ssl.errorReporting.enabled", false);
user_pref("security.ssl.errorReporting.url", "");
user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
user_pref("security.ssl.require_safe_negotiation", true);
user_pref("security.tls.enable_0rtt_data", false);
user_pref("security.tls.version.min", 3);
user_pref("security.tls.version.max", 4);
user_pref("security.tls.version.fallback-limit", 4);
user_pref("security.xpconnect.plugin.unrestricted", false);
user_pref("security.webauth.u2f", true);
user_pref("services.blocklist.update_enabled", true);
user_pref("shield.savant.enabled", false);
user_pref("shumway.disabled", true);
user_pref("signon.autofillForms", false);
user_pref("signon.autofillForms.http", false);
user_pref("signon.formlessCapture.enabled", false);
user_pref("signon.rememberSignons", false);
user_pref("startup.homepage_welcome_url", "");
user_pref("toolkit.coverage.opt-out", true);
user_pref("toolkit.coverage.endpoint.base", "");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.cachedClientID", "");
user_pref("toolkit.telemetry.coverage.opt-out", true);  // disable telemetry coverage
user_pref("toolkit.telemetry.enabled", false);  // disable Mozilla telemetry
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.hybridContent.enabled", false);
user_pref("toolkit.telemetry.infoURL", "");
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.previousBuildID", "");
user_pref("toolkit.telemetry.prompted", 2);
user_pref("toolkit.telemetry.rejected", true);
user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.unified", false);  // disable telemetry
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.winRegisterApplicationRestart", false);  // disable session restore
user_pref("ui.use_standins_for_native_colors", true);  // disable exposing system colors to canvas
user_pref("webchannel.allowObject.urlWhitelist", "");
user_pref("webgl.disabled", true);  // disable WebGL
user_pref("webgl.disable-extensions", true);
user_pref("webgl.disable-fail-if-major-performance-caveat", true);
user_pref("webgl.dxgl.enabled", false);
user_pref("webgl.enable-debug-renderer-info", false);  // do not expose graphics driver information
user_pref("webgl.enable-webgl2", false);
user_pref("webgl.min_capability_mode", true);
user_pref("xpinstall.signatures.required", true);  // extensions must be signed
