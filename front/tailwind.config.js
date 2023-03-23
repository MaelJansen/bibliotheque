/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
    'node_modules/flowbite-react/**/*.{js,jsx,ts,tsx}'
  ],
  theme: {
    extend: {
      fontFamily: {
        'saira' : ['Saira', 'cursive'],
      },
      colors: {
        'iut-green' : '#009999',
        'iut-hover-green' : '#086969'
      },
    },
  },
  plugins: [require('tailwind-hamburgers'),
    require('flowbite/plugin'),],
}
