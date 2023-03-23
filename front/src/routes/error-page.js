import { useRouteError } from "react-router-dom";

export default function ErrorPage() {
  const error = useRouteError();
  console.error(error);

  const imgPath = "https://http.cat/" + String(error.status);

  return (
    <div id="error-page" className="w-screen h-screen flex flex-col items-center bg-black">
      <img src={imgPath} alt={error.statusText}></img>
    </div>
  );
}