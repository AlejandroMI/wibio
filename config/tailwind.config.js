const defaultTheme = require('tailwindcss/defaultTheme')
const colors = require('tailwindcss/colors')

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './app/components/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        primary: {
          light: "#A1AEDD",
          DEFAULT: "#445EBB",
          dark: "#33468C",
        },
        secondary: {
          light: "#FFCFC5",
          DEFAULT: "#FFA08B",
          dark: "#BF7868"
        },
        tertiary: {
          light: "#FFE7A8",
          DEFAULT: "#FFCE51",
          dark: "#BF9B3D"
        },
      },
    },
  },
  variants: {
    extend: {
      backgroundColor: ["active"],
      boxShadow: ["active"]
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
