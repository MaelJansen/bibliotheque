import { Outlet } from "react-router-dom";
import Footer from "../components/Footer";
import Header from "../components/Header";
import SearchBar from "../components/searchbar";

export default function Main() {
    return (
        <>
            <Header />
            <SearchBar />
            <Outlet />
            <Footer />
        </>
    );
}