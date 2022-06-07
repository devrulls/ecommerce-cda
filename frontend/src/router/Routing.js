import React from "react";
import {Routes, Route, Navigate} from "react-router-dom";
import {Error} from "../components/Error";
import {HomeScreen} from "../screens/HomeScreen";
import {ProductScreen} from "../screens/ProductScreen";
import {CartScreen} from "../screens/CartScreen";
import {LoginScreen} from "../screens/LoginScreen";
import {RegisterScreen} from "../screens/RegisterScreen";
import {ProfileScreen} from "../screens/ProfileScreen";
import {UserListScreen} from "../screens/UserListScreen";
import {UserEditScreen} from "../screens/UserEditScreen";
import {ProductListScreen} from "../screens/ProductListScreen";
import {ProductEditScreen} from "../screens/ProductEditScreen";

export const Routing = () => {
    return (
            <Routes>
                {/*<Route path="/" element={<Navigate to="/home"/>}/>*/}
                {/*<Route path="/home" element={<HomeScreen/>}/>*/}
                <Route path="/" element={<HomeScreen/>}/>
                <Route path="/login" element={<LoginScreen/>}/>
                <Route path="/register" element={<RegisterScreen/>}/>
                <Route path="/profile" element={<ProfileScreen/>}/>
                <Route path="/product/:id" element={<ProductScreen/>}/>
                <Route path="/cart/:id" element={<CartScreen/>}/>
                <Route path="/cart" element={<CartScreen/>}/>

                <Route path="/admin/userList" element={<UserListScreen/>}/>
                <Route path="/admin/user/:id/edit" element={<UserEditScreen/>}/>

                <Route path="/admin/productList" element={<ProductListScreen/>}/>
                <Route path="/admin/product/:id/edit" element={<ProductEditScreen/>}/>
                {/*<Route path="/admin/orderList" element={<OrderListScreen/>}/>*/}

                <Route path="*" element={<Error/>}/>
            </Routes>
    )
}
