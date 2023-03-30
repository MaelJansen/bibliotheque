function Login() {
  return (
    <div className="flex flex-col w-full items-center mt-3">
      <p className="text-iut-green text-2xl">Connexion</p>
      <form className="md:w-1/3 space-y-4">
        <div className="w-full">
          <label for="login" class=" text-sm">
            Identifiant
          </label>
          <input
            type="text"
            name="login"
            id="login"
            className="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg w-full p-2.5 focus:ring-iut-green focus:ring-3"
            placeholder="Identifiant"
            required
          />
        </div>
        <div className="w-full">
          <label for="login" class=" text-sm">
            Mot de passe
          </label>
          <input
            type="password"
            name="password"
            id="password"
            className="bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg w-full p-2.5 focus:ring-iut-green focus:ring-3"
            placeholder="Mot de passe"
            required
          />
        </div>
        <div>
          <button
            type="submit"
            class="w-full text-white bg-iut-green hover:bg-iut-hover-green focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center"
          >
            Sign in
          </button>
        </div>
      </form>
    </div>
  );
}

export default Login;
