{
  "log": {
    "level": "debug",
    "timestamp": true
  },
  "dns": {
    "servers": [
      {
        "tag": "proxyDns",
        "address": "8.8.8.8",
        "detour": "proxy"
      },
      {
        "tag": "localDns",
        "address": "https://223.5.5.5/dns-query",
        "detour": "direct"
      },
      {
        "tag": "block",
        "address": "rcode://success"
      },
      {
        "tag": "remote",
        "address": "fakeip"
      }
    ],
    "rules": [
      {
        "domain": [
          "ghproxy.com",
          "cdn.jsdelivr.net"
        ],
        "server": "localDns"
      },
      {
        "geosite": "category-ads-all",
        "server": "block"
      },
      {
        "outbound": "any",
        "server": "localDns",
        "disable_cache": true
      },
      {
        "geosite": "cn",
        "server": "localDns"
      },
      {
        "clash_mode": "direct",
        "server": "localDns"
      },
      {
        "clash_mode": "global",
        "server": "proxyDns"
      },
      {
        "geosite": "geolocation-!cn",
        "server": "proxyDns"
      },
      {
        "query_type": [
          "A",
          "AAAA"
        ],
        "server": "remote"
      }
    ],
    "fakeip": {
      "enabled": true,
      "inet4_range": "198.18.0.0/15",
      "inet6_range": "fc00::/18"
    },
    "independent_cache": true,
    "strategy": "ipv4_only"
  },
  "inbounds": [
    {
      "type": "tun",
      "inet4_address": "172.19.0.1/30",
      "mtu": 9000,
      "auto_route": true,
      "strict_route": true,
      "sniff": true,
      "endpoint_independent_nat": false,
      "stack": "system",
      "platform": {
        "http_proxy": {
          "enabled": true,
          "server": "127.0.0.1",
          "server_port": 2080
        }
      }
    },
    {
      "type": "mixed",
      "listen": "127.0.0.1",
      "listen_port": 2080,
      "sniff": true,
      "users": []
    }
  ],
  "outbounds": [
    {
      "tag": "proxy",
      "type": "selector",
      "outbounds": [
        "auto",
        "direct",
        "东京106",
		"东京226"
      ]
    },
    {
      "tag": "🤖 OpenAI",
      "type": "selector",
      "outbounds": [
        "东京106",
		"东京226"
      ]
    },
    {
      "tag": "🌌 Google",
      "type": "selector",
      "outbounds": [
        "东京106",
		"东京226"
      ]
    },
    {
      "tag": "📟 Telegram",
      "type": "selector",
      "outbounds": [
        "东京106",
		"东京226"
      ]
    },
    {
      "tag": "🐦 Twitter",
      "type": "selector",
      "outbounds": [
        "东京106",
		"东京226"
      ]
    },
    {
      "tag": "👤 Facebook",
      "type": "selector",
      "outbounds": [
        "东京106",
		"东京226"
      ]
    },
    {
      "tag": "🛍️ Amazon",
      "type": "selector",
      "outbounds": [
        "direct",
        "东京106",
		"东京226"
      ]
    },
    {
      "tag": "🍎 Apple",
      "type": "selector",
      "outbounds": [
        "direct",
        "东京106",
		"东京226"
      ]
    },
    {
      "tag": "🧩 Microsoft",
      "type": "selector",
      "outbounds": [
        "direct",
        "东京106",
		"东京226"
      ]
    },
    {
      "tag": "🎮 Game",
      "type": "selector",
      "outbounds": [
        "direct",
        "东京106",
		"东京226"
      ]
    },
    {
      "tag": "📺 Bilibili",
      "type": "selector",
      "outbounds": [
        "direct"
      ]
    },
    {
      "tag": "🎬 MediaVideo",
      "type": "selector",
      "outbounds": [
        "direct",
        "东京106",
		"东京226"
      ]
    },
    {
      "tag": "🌏 !cn",
      "type": "selector",
      "outbounds": [
        "direct",
        "东京106",
		"东京226"
      ]
    },
    {
      "tag": "auto",
      "type": "urltest",
      "outbounds": [
        "东京106",
		"东京226"
      ],
      "url": "http://www.gstatic.com/generate_204",
      "interval": "1m",
      "tolerance": 50
    },
    {
      "type": "direct",
      "tag": "direct"
    },
    {
      "type": "dns",
      "tag": "dns-out"
    },
    {
      "type": "block",
      "tag": "block"
    },
    {
      "tag": "东京106",
      "type": "vless",
      "server": "d106.",
      "server_port": 443,
      "uuid": "4d293653-8b1c-4dd6-a5b4-cff62a04a5c1",
      "packet_encoding": "xudp",
      "flow": "xtls-rprx-vision",
      "tls": {
        "enabled": true,
        "server_name": "d106.",
        "utls": {
          "enabled": true,
          "fingerprint": "chrome"
        }
      }
    }
    {
      "tag": "东京226",
      "type": "vless",
      "server": "d106.xyz",
      "server_port": 443,
      "uuid": "3b0f1c67-e3a6-4c91-ce5e-b872a38c2467",
      "packet_encoding": "xudp",
      "flow": "xtls-rprx-vision",
      "tls": {
        "enabled": true,
        "server_name": "d106.xyz",
        "utls": {
          "enabled": true,
          "fingerprint": "chrome"
        }
      }
    }
  ],
  "route": {
    "auto_detect_interface": true,
    "final": "proxy",
    "geoip": {
      "download_url": "https://ghproxy.com/github.com/SagerNet/sing-geoip/releases/latest/download/geoip.db",
      "download_detour": "direct"
    },
    "geosite": {
      "download_url": "https://ghproxy.com/github.com/SagerNet/sing-geosite/releases/latest/download/geosite.db",
      "download_detour": "direct"
    },
    "rules": [
      {
        "protocol": "dns",
        "outbound": "dns-out"
      },
      {
        "network": "udp",
        "port": 443,
        "outbound": "block"
      },
      {
        "geosite": "category-ads-all",
        "outbound": "block"
      },
      {
        "clash_mode": "direct",
        "outbound": "direct"
      },
      {
        "clash_mode": "global",
        "outbound": "proxy"
      },
      {
        "domain": [
          "clash.razord.top",
          "yacd.metacubex.one",
          "yacd.haishan.me",
          "d.metacubex.one"
        ],
        "outbound": "direct"
      },
      {
        "geosite": "openai",
        "outbound": "🤖 OpenAI"
      },
      {
        "geosite": "youtube",
        "outbound": "🌌 Google"
      },
      {
        "geoip": "google",
        "outbound": "🌌 Google"
      },
      {
        "geosite": [
          "google",
          "github"
        ],
        "outbound": "🌌 Google"
      },
      {
        "geoip": "telegram",
        "outbound": "📟 Telegram"
      },
      {
        "geosite": "telegram",
        "outbound": "📟 Telegram"
      },
      {
        "geoip": "twitter",
        "outbound": "🐦 Twitter"
      },
      {
        "geosite": "twitter",
        "outbound": "🐦 Twitter"
      },
      {
        "geoip": "facebook",
        "outbound": "👤 Facebook"
      },
      {
        "geosite": [
          "facebook",
          "instagram"
        ],
        "outbound": "👤 Facebook"
      },
      {
        "geosite": "amazon",
        "outbound": "🛍️ Amazon"
      },
      {
        "geosite": "apple",
        "outbound": "🍎 Apple"
      },
      {
        "geosite": "apple-cn",
        "outbound": "🍎 Apple"
      },
      {
        "geosite": "microsoft",
        "outbound": "🧩 Microsoft"
      },
      {
        "geosite": "category-games",
        "outbound": "🎮 Game"
      },
      {
        "geosite": "bilibili",
        "outbound": "📺 Bilibili"
      },
      {
        "geoip": "netflix",
        "outbound": "🎬 MediaVideo"
      },
      {
        "geosite": [
          "tiktok",
          "netflix",
          "hbo",
          "disney",
          "primevideo"
        ],
        "outbound": "🎬 MediaVideo"
      },
      {
        "geosite": "geolocation-!cn",
        "outbound": "🌏 !cn"
      },
      {
        "geoip": [
          "private",
          "cn"
        ],
        "outbound": "direct"
      },
      {
        "geosite": "cn",
        "outbound": "direct"
      }
    ]
  },
  "experimental": {
    "clash_api": {
      "external_controller": "127.0.0.1:9090",
      "external_ui_download_url": "",
      "external_ui_download_detour": "",
      "external_ui": "ui",
      "secret": "",
      "default_mode": "rule",
      "store_selected": true,
      "cache_file": "",
      "cache_id": ""
    }
  }
}
