import defaultTheme from 'tailwindcss/defaultTheme'
import colors from 'tailwindcss/colors'

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/assets/stylesheets/**/*.css',
    './app/previews/**/*.rb',
    './app/views/**/*.{erb,html}',
    './gems/componeer/app/components/**/*.{html,rb,erb,yml}',
    './gems/componeer/app/helpers/**/*.rb',
    './gems/componeer/app/javascript/**/*.js',
    './gems/componeer/spec/components/**/*_spec.rb',
  ],
  darkMode: 'class',
  theme: {
    extend: {
      fontFamily: {
        body: ['Inter', ...defaultTheme.fontFamily.sans],
        sans: ['Inter', ...defaultTheme.fontFamily.sans],
      },

      fontSize: {
        xs: '.75rem',
        sm: '.875rem',
        tiny: '.875rem',
        base: '1rem',
        lg: '1.125rem',
        xl: '1.25rem',
        '2xl': '1.5rem',
        '3xl': '1.875rem',
        '4xl': '2.25rem',
        '5xl': '3rem',
        '6xl': '4rem',
        '7xl': '5rem',
      },

      zIndex: {
        '0': 0,
        '1': 1,
        '2': 2,
        '5': 5,
        '10': 10,
        '20': 20,
        '30': 30,
        '40': 40,
        '50': 50,
        '25': 25,
        '75': 75,
        '100': 100,
        'auto': 'auto',
      },

      maxWidth: {
        '1/4': '25%',
        '1/3': '33.333333%',
        '1/2': '50%',
        '3/4': '75%',
        'full': '100%',
        '0': '0rem',
        'none': 'none',
        '7xs': '8rem',
        '6xs': '10rem',
        '5xs': '12rem',
        '4xs': '14rem',
        '3xs': '16rem',
        '2xs': '18rem',
        'xs': '20rem',
        'sm': '24rem',
        'md': '28rem',
        'lg': '32rem',
        'xl': '36rem',
        '2xl': '42rem',
        '3xl': '48rem',
        '4xl': '56rem',
        '5xl': '64rem',
        '6xl': '72rem',
        '7xl': '80rem',
        'min': 'min-content',
        'max': 'max-content',
      },

      width: {
        '1/24': '4.16666666667%',
        '2/24': '8.33333333333%',
        '3/24': '12.5%',
        '4/24': '16.6666666667%',
        '5/24': '20.8333333333%',
        '6/24': '25%',
        '7/24': '29.1666666667%',
        '8/24': '33.33333333333%',
        '9/24': '37.5%',
        '10/24': '41.16666666667%',
        '11/24': '45.83333333333%',
        '12/24': '50%',
        '13/24': '54.1666666667%',
        '14/24': '58.3333333333%',
        '15/24': '62.5%',
        '16/24': '66.6666666667%',
        '17/24': '70.8333333333%',
        '18/24': '75%',
        '19/24': '79.1666666667%',
        '20/24': '83.3333333333%',
        '21/24': '87.5%',
        '22/24': '91.6666666667%',
        '23/24': '95.8333333333%',
        '24/24': '100%'
      },

      colors: {
        brand: {
          '50': '#EFF6FF',
          '100': '#DBEAFE',
          '200': '#BFDBFE',
          '300': '#93C5FD',
          '400': '#60A5FA',
          '500': '#3B82F6',
          '600': '#2563EB',
          '700': '#1D4ED8',
          '800': '#1E40AF',
          '900': '#1E3A8A',
        },
        blue: colors.blue,
        emerald: colors.emerald,
        green: colors.green,
        orange: colors.orange,
        rose: colors.rose,
        sky: colors.sky,
        teal: colors.teal,
      },

      spacing: {
        '128': '35rem',
        '144': '36rem',
        '160': '40rem',
        '192': '48rem'
      }
    },
  },
  plugins: [
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
  ],
}
