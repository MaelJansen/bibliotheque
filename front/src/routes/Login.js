import axios from "axios";
import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

function Login() {

  const navigate = useNavigate();

  const [inputs, setInputs] = useState({username: "", password: ""});
  const [data, setData] = useState({});

  const handleChange = (event) => {
    const name = event.target.name;
    const value = event.target.value;
    setInputs(values => ({...values, [name]: value}));
  }

  const handleSubmit = async (event) => {
    event.preventDefault();
    getToken();
  }

  useEffect(() =>{
    console.log(data);
    if (data.token) {
      console.log(data.token);
      localStorage.setItem("token", data.token);
      localStorage.setItem("userId", data.userId);
      navigate('/');
    } else {
      return;
    } 
  }, [data])

  function getToken() {
    let serverQuery = `${process.env.REACT_APP_API_URL}:${process.env.REACT_APP_API_PORT}/api/login`;
    axios
    .post(serverQuery, inputs)
    .then(response => {
      console.log(response);
      setData(response.data);
    })
    .catch(error => {
      setData({
        "error": error.response.status
      })
    })
  }

  return (
    <div className="flex flex-col w-full items-center mt-3">
      <p className="text-iut-green text-2xl">Connexion</p>
      <form className="md:w-1/3 space-y-4"
      onSubmit={handleSubmit}>
        <div className="w-full">
          <label for="username" class=" text-sm">
            Identifiant
          </label>
          <input
            type="email"
            name="username"
            id="username"
            value={inputs.email}
            onChange={handleChange}
            className="peer bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg w-full p-2.5 focus:ring-iut-green focus:ring-3"
            placeholder="Identifiant"
            required
          />
        <p className="text-red-600 hidden peer-:inline">Un email valid doit etre rentrer</p>
        </div>
        <div className="w-full">
          <label for="login" class=" text-sm">
            Mot de passe
          </label>
          <input
            type="password"
            name="password"
            id="password"
            value={inputs.password}
            onChange={handleChange}
            placeholder="Mot de passe"
            required
            className="peer bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg w-full p-2.5 focus:ring-iut-green focus:ring-3 "
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
        {data.error ? <p className="text-red-600">Erreur de connexion</p> : ""}
      </form>
    </div>
  );
}

export default Login;
