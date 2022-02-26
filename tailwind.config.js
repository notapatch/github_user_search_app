const defaultTheme = require("tailwindcss/defaultTheme")

module.exports = {
  darkMode: 'class',
  content: [
    './app/components/**/*',
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/images/**/*.svg',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      backgroundColor: {
        skin: {
          fill: {
            accent: 'var(--fill--accent)',
            base:   'var(--fill--base)',
            'primary-button': 'var(--accent)',
            'primary-button-hover': 'var(--accent--hover)',
          },
          helper: {
            danger: 'var(--helper--danger)',
          }
        }
      },
      fontFamily: {
        mono: ['Space Mono', ...defaultTheme.fontFamily.mono]
      },
      textColor: {
        skin: {
          accent: 'var(--accent)',
          helper: {
            danger: 'var(--helper--danger)',
          },
          'primary-button': 'var(--text--primary--button)',
          100: 'var(--text--100)',
          '100--hover': 'var(--text--100--hover)',
          200: 'var(--text--200)',
          300: 'var(--text--300)',
          400: 'var(--text--400)',
        },
      }
    },
    fontSize: {
      xs: ["11px", { lineHeight: "16px" }],
      sm: ["13px", { lineHeight: "25px" }],
      base: ["15px", { lineHeight: "25px" }],
      lg: ["16px", { lineHeight: "23.7px" }],
      xl: ["18px", { lineHeight: "25px" }],
      "2xl": ["22px", { lineHeight: "32px" }],
      "3xl": ["26px", { lineHeight: "38.51px" }],
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
  ]
}
