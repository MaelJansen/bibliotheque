/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {
      backgroundImage: {
        'header-img': "url('/src/img/library.jpg')",
      },
      fontFamily: {
        'saira' : ['Saira', 'cursive'],
      },
      colors: {
        'iut-green' : '#009999',
        'iut-hover-green' : '#086969'
      },
    },
  },
  plugins: [],
}
