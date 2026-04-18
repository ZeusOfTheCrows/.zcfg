// ** Theme Default Options ****************************************************

// // for blurry theme:
// // https://github.com/Filip-Sutkowy/blurclean-firefox-theme
// user_pref("svg.context-properties.content.enabled", true);
// user_pref("layers.acceleration.force-enabled", true);
// user_pref("gfx.webrender.all", true);
// user_pref("gfx.webrender.enabled", true);
// user_pref("layout.css.backdrop-filter.enabled", true);

// for wavefox
// user_pref("WaveFox.Tabs.Shape", 11);
// user_pref("WaveFox.DragSpace.TabBarLeftSide.Disabled", true);
// user_pref("WaveFox.DragSpace.TabBarRightSide.Disabled", true);
// user_pref("svg.context-properties.content.enabled", true);  // } for context
// user_pref("WaveFox.Icons", 1);                              // } menu icons

// user_pref("WaveFox.Linux.Transparency.Enabled", true);     // } for
// user_pref("WaveFox.Toolbar.Transparency", 2);               // } transparency
// user_pref("WaveFox.Tabs.Separators", 2);                    // }
// user_pref("WaveFox.WebPage.Transparency", 2);               // }
// user_pref("WaveFox.WebPage.Background.Saturation", 2);      // }
// user_pref("browser.tabs.allow_transparent_browser", true);  // }

// user_pref("WaveFox.DarkTheme.Tabs.Shadows", 2);              // } for no
// user_pref("WaveFox.Tabs.Background.Inactive.Enabled", true); // } transparency

// ** lepton theme options *****************************************************

user_pref("userChrome.theme.proton_chrome", false);  // disable popup redesign
user_pref("userChrome.decoration.field_border", false);  // disable some borders
user_pref("userChrome.decoration.download_panel", true);  // strikethrought deleted downloads (test)
user_pref("userChrome.decoration.animate", true);  // various animations
user_pref("userChrome.padding.global_menubar", false);  // test to avoid menubar not touching window top

user_pref("userChrome.tab.connect_to_window", true);   // } lepton tabs
user_pref("userChrome.tab.lepton_like_padding", true); // }
user_pref("userChrome.tab.dynamic_separator", true);   // }
user_pref("userChrome.tab.color_like_toolbar", false); // } (worse with vivaldi)

user_pref("userChrome.tab.box_shadow", false);  // (outline, not a shadow)
user_pref("userChrome.tab.bottom_rounded_corner", true);
user_pref("userChrome.tab.bottom_rounded_corner.all", true);  // fix containers
user_pref("userChrome.tab.bottom_rounded_corner.chrome", false);  // shape
user_pref("userChrome.tab.bottom_rounded_corner.australis", false);  // shape
user_pref("userChrome.tab.photon_like_contextline", false);

user_pref("userChrome.tab.unloaded", true); // dim unloaded tabs
user_pref("userChrome.tab.letters_cleary", true); // truncate tab titles less
user_pref("userChrome.tab.close_button_at_hover", true);  // } only show close ×
user_pref("userChrome.tab.close_button_at_hover.always", true);  // } on hover

user_pref("userChrome.tab.container", true);  // } container colour to bottom

user_pref("userChrome.tab.newtab_button_smaller", false);
user_pref("userContent.page.illustration", false);  // restore error page images

user_pref("userContent.page.dark_mode", true);  // dark in restricted pages
user_pref("userContent.page.proton_color.system_accent", true);
user_pref("widget.non-native-theme.use-theme-accent", true);
user_pref("userChrome.findbar.floating_on_top", false);  // find bar at top

// =============================================================================

// ** User Options *************************************************************

// userchrome.css usercontent.css activate
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("svg.context-properties.content.enabled", true);

// ui controllable options
user_pref("browser.aboutConfig.showWarning", false);
user_pref("browser.startup.homepage", "about:home");
user_pref("browser.ctrlTab.previews", true);  // don't think this works anymore
user_pref("browser.uidensity", 1);  // compact mode
user_pref("browser.urlbar.trimURLs", false);// don't hide protocol (http[s]://)'
user_pref("findbar.highlightAll", true);
user_pref("general.autoScroll", true);  // middle-mouse scroll on linux
user_pref("browser.toolbars.bookmarks.visibility", "always");  // bookmarks bar
// cleanup new tab page (ntp)
user_pref("browser.newtabpage.activity-stream.showWeather", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
// "Customise Toolbar"
// user_pref("browser.uiCustomization.state", "{\"placements\":{\"widget-overflow-fixed-list\":[],\"unified-extensions-area\":[\"enhancerforyoutube_maximerf_addons_mozilla_org-browser-action\",\"_036a55b4-5e72-4d05-a06c-cba2dfcc134a_-browser-action\",\"_a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7_-browser-action\",\"_b86e4813-687a-43e6-ab65-0bde4ab75758_-browser-action\",\"sponsorblocker_ajay_app-browser-action\",\"tab-session-manager_sienori-browser-action\",\"_c2c003ee-bd69-42a2-b0e9-6f34222cb046_-browser-action\",\"_f4461878-c744-4acf-871a-8311588d35ce_-browser-action\",\"_a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad_-browser-action\",\"jid1-kkzogwgsw3ao4q_jetpack-browser-action\",\"_d197a819-709b-4352-8cd4-f87e11300617_-browser-action\",\"webscrapbook_danny0838_addons_mozilla_org-browser-action\",\"neaturl_hugsmile_eu-browser-action\",\"_58204f8b-01c2-4bbc-98f8-9a90458fd9ef_-browser-action\",\"_2e5ff8c8-32fe-46d0-9fc8-6b8986621f3c_-browser-action\",\"atbc_easonwong-browser-action\",\"_c13e9f22-6988-4543-86b9-b71bc7e71560_-browser-action\",\"jid1-tsgsxbhncspbwq_jetpack-browser-action\",\"plasma-browser-integration_kde_org-browser-action\",\"visualtab_xuldev_org-browser-action\",\"idcac-pub_guus_ninja-browser-action\",\"dont-accept-webp_jeffersonscher_com-browser-action\",\"forget-me-not_lusito_info-browser-action\",\"_75ebcf9a-65c4-4c9b-85b0-b7d84558bab7_-browser-action\",\"dearrow_ajay_app-browser-action\",\"_b11bea1f-a888-4332-8d8a-cec2be7d24b9_-browser-action\",\"_eac1b56f-f3a7-40f4-9181-557dd6e63bf3_-browser-action\",\"gdpr_cavi_au_dk-browser-action\",\"_b7f9d2cd-d772-4302-8c3f-eb941af36f76_-browser-action\",\"_4c421bb7-c1de-4dc6-80c7-ce8625e34d24_-browser-action\",\"jid0-3guet1r69sqnsrca5p8kx9ezc3u_jetpack-browser-action\",\"your_unique_addon_id_here_example_com-browser-action\",\"nordvpnproxy_nordvpn_com-browser-action\",\"_531906d3-e22f-4a6c-a102-8057b88a1a63_-browser-action\",\"_vivaldi-fox-browser-action\"],\"nav-bar\":[\"fxa-toolbar-menu-button\",\"sidebar-button\",\"firefox-view-button\",\"back-button\",\"forward-button\",\"stop-reload-button\",\"history-panelmenu\",\"vertical-spacer\",\"home-button\",\"urlbar-container\",\"downloads-button\",\"jid1-mnnxcxisbpnsxq_jetpack-browser-action\",\"ublock0_raymondhill_net-browser-action\",\"inodhwnfgtr463428675drebcs_jetpack-browser-action\",\"_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action\",\"jid1-qofqdk4qzufgwq_jetpack-browser-action\",\"_d07ccf11-c0cd-4938-a265-2a4d6ad01189_-browser-action\",\"addon_darkreader_org-browser-action\",\"_cb31ec5d-c49a-4e5a-b240-16c767444f62_-browser-action\",\"firefox_newsguardtech_com-browser-action\",\"_73a6fe31-595d-460b-a920-fcc0f8843232_-browser-action\",\"firemonkey_eros_man-browser-action\",\"_aecec67f-0d10-4fa7-b7c7-609a2db280cf_-browser-action\",\"reset-pbm-toolbar-button\",\"7esoorv3_alefvanoon_anonaddy_me-browser-action\",\"firefoxpwa_filips_si-browser-action\",\"_76faaba6-3aa1-47a4-bf40-90aa2505e79c_-browser-action\",\"userChromebtnMenu\",\"tab-stash_condordes_net-browser-action\",\"_testpilot-containers-browser-action\",\"unified-extensions-button\"],\"toolbar-menubar\":[\"menubar-items\"],\"TabsToolbar\":[\"alltabs-button\",\"tabbrowser-tabs\",\"new-tab-button\",\"customizableui-special-spring91\",\"fullscreen-button\"],\"vertical-tabs\":[],\"PersonalToolbar\":[\"personal-bookmarks\"],\"status-bar\":[\"status-text\"]},\"seen\":[\"save-to-pocket-button\",\"developer-button\",\"_b86e4813-687a-43e6-ab65-0bde4ab75758_-browser-action\",\"_c13e9f22-6988-4543-86b9-b71bc7e71560_-browser-action\",\"atbc_easonwong-browser-action\",\"_2e5ff8c8-32fe-46d0-9fc8-6b8986621f3c_-browser-action\",\"_a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7_-browser-action\",\"_58204f8b-01c2-4bbc-98f8-9a90458fd9ef_-browser-action\",\"neaturl_hugsmile_eu-browser-action\",\"webscrapbook_danny0838_addons_mozilla_org-browser-action\",\"jid1-mnnxcxisbpnsxq_jetpack-browser-action\",\"ublock0_raymondhill_net-browser-action\",\"inodhwnfgtr463428675drebcs_jetpack-browser-action\",\"_d197a819-709b-4352-8cd4-f87e11300617_-browser-action\",\"_c2c003ee-bd69-42a2-b0e9-6f34222cb046_-browser-action\",\"sponsorblocker_ajay_app-browser-action\",\"jid1-kkzogwgsw3ao4q_jetpack-browser-action\",\"_f4461878-c744-4acf-871a-8311588d35ce_-browser-action\",\"_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action\",\"jid1-qofqdk4qzufgwq_jetpack-browser-action\",\"enhancerforyoutube_maximerf_addons_mozilla_org-browser-action\",\"_d07ccf11-c0cd-4938-a265-2a4d6ad01189_-browser-action\",\"_a4c4eda4-fb84-4a84-b4a1-f7c1cbf2a1ad_-browser-action\",\"jid1-tsgsxbhncspbwq_jetpack-browser-action\",\"tab-stash_condordes_net-browser-action\",\"_036a55b4-5e72-4d05-a06c-cba2dfcc134a_-browser-action\",\"addon_darkreader_org-browser-action\",\"plasma-browser-integration_kde_org-browser-action\",\"visualtab_xuldev_org-browser-action\",\"_cb31ec5d-c49a-4e5a-b240-16c767444f62_-browser-action\",\"firefox_newsguardtech_com-browser-action\",\"idcac-pub_guus_ninja-browser-action\",\"dont-accept-webp_jeffersonscher_com-browser-action\",\"forget-me-not_lusito_info-browser-action\",\"_73a6fe31-595d-460b-a920-fcc0f8843232_-browser-action\",\"_75ebcf9a-65c4-4c9b-85b0-b7d84558bab7_-browser-action\",\"7esoorv3_alefvanoon_anonaddy_me-browser-action\",\"dearrow_ajay_app-browser-action\",\"firemonkey_eros_man-browser-action\",\"_aecec67f-0d10-4fa7-b7c7-609a2db280cf_-browser-action\",\"tab-session-manager_sienori-browser-action\",\"_b11bea1f-a888-4332-8d8a-cec2be7d24b9_-browser-action\",\"_testpilot-containers-browser-action\",\"_eac1b56f-f3a7-40f4-9181-557dd6e63bf3_-browser-action\",\"gdpr_cavi_au_dk-browser-action\",\"_b7f9d2cd-d772-4302-8c3f-eb941af36f76_-browser-action\",\"screenshot-button\",\"_4c421bb7-c1de-4dc6-80c7-ce8625e34d24_-browser-action\",\"jid0-3guet1r69sqnsrca5p8kx9ezc3u_jetpack-browser-action\",\"your_unique_addon_id_here_example_com-browser-action\",\"nordvpnproxy_nordvpn_com-browser-action\",\"_531906d3-e22f-4a6c-a102-8057b88a1a63_-browser-action\",\"firefoxpwa_filips_si-browser-action\",\"_vivaldi-fox-browser-action\",\"_76faaba6-3aa1-47a4-bf40-90aa2505e79c_-browser-action\",\"userChromebtnMenu\"],\"dirtyAreaCache\":[\"nav-bar\",\"PersonalToolbar\",\"toolbar-menubar\",\"TabsToolbar\",\"unified-extensions-area\",\"widget-overflow-fixed-list\",\"vertical-tabs\",\"status-bar\"],\"currentVersion\":23,\"newElementCount\":91}");


// currently not using, saving here as mnemonic
// user_pref("doh-rollout.uri", 'https://private.canadianshield.cira.ca/dns-query');

// tap alt to focus menubar
user_pref("ui.key.menuAccessKeyFocuses", true);

// possible upcoming feature?
user_pref("browser.tabs.notes.enabled", true);

// disable focussable "..." in urlbar suggestions
user_pref("browser.urlbar.resultMenu", true);
// user_pref("browser.urlbar.resultMenu", false);
user_pref("browser.urlbar.resultMenu.keyboardAccessible", false);
// disable "search with [x] in urlbar"
user_pref("browser.urlbar.suggest.engines", false);

// Restore Compact Mode - 89 Above
user_pref("browser.compactmode.show", true);

// CSS's `:has()` selector #457 - 103 Above
// user_pref("layout.css.has-selector.enabled", true);  // no longer needed

// ** Useful Options ***********************************************************
// Integrated calculator at urlbar
user_pref("browser.urlbar.suggest.calculator", true);

// Integrated unit convertor at urlbar
user_pref("browser.urlbar.unitConversion.enabled", true);

// Draw in Titlebar
// user_pref("browser.tabs.drawInTitlebar", true);
// user_pref("browser.tabs.inTitlebar",        1); // Nightly, 96 Above

user_pref("browser.aboutConfig.showWarning", false);
user_pref("browser.download.autohideButton", false);
//?\ show suggestions in private windows
user_pref("browser.search.suggest.enabled.private", true);
// compact mode
user_pref("browser.uidensity", 1);
user_pref("findbar.highlightAll", true);
//?\ autoscroll middle mouse on linux
user_pref("general.autoScroll", 1);

// disable error sound on "find in page" not found
// user_pref("accessibility.typeaheadfind.enablesound", false)
// replace with system bell sound (nasty crunch on tumbleweed)
user_pref("accessibility.typeaheadfind.soundURL", "beep"); // default: "default"

// don't hide `http[s]` in url bar
user_pref("browser.urlbar.trimURLs", false);

// use global menu bar (on kde, at least)
// (unuseably laggy and unfinished, as of 2026-03-15)
// https://old.reddit.com/r/kde/comments/1l0ybn9/global_menu_now_works_with_firefox/
// user_pref("widget.gtk.global-menu.enabled", true);
// user_pref("widget.gtk.global-menu.wayland.enabled", true);

// round bottom window corners
user_pref("widget.gtk.rounded-bottom-corners.enabled", true);

// accessible scrollbars
user_pref("widget.gtk.overlay-scrollbars.enabled", false);
user_pref("widget.non-native-theme.scrollbar.style", 5);
user_pref("widget.non-native-theme.scrollbar.size.override", 12);

// fix copy from private windows
// https://old.reddit.com/r/firefox/comments/1nbtpwb/
user_pref("clipboard.copyPrivateDataToClipboardCloudOrHistory", true);

// disable target="_blank"
// (doesn't work like target="_top", so ublock solution is still better)
user_pref("browser.link.open_newwindow", 1);
// open links from without firefox in a new window
user_pref("browser.link.open_newwindow.override.external", 2);
// warn before automatic redirect (mainly for tumblr/webarchive,
// doesn't work for google)
user_pref("accessibility.blockautorefresh", false);

// ai bullshit (christ there's a lot of it)
user_pref("browser.ai.control.default", "blocked");
user_pref("browser.ai.control.linkPreviewKeyPoints", "blocked");
user_pref("browser.ai.control.pdfjsAltText", "blocked");
user_pref("browser.ai.control.sidebarChatbot", "blocked");
user_pref("browser.ai.control.smartTabGroups", "blocked");
user_pref("browser.ml.chat.enabled", false);
user_pref("browser.ml.chat.page", false);
user_pref("browser.ml.linkPreview.enabled", false);
user_pref("browser.tabs.groups.smart.enabled", false);
user_pref("browser.tabs.groups.smart.userEnabled", false);
user_pref("extensions.ml.enabled", false);

user_pref("browser.ai.control.translations", "available");

// tapping `alt` focusses menu (disabling would be more consistent with kde)
user_pref("ui.key.menuAccessKeyFocuses", true);

// user_pref("", );
