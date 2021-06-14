import React from 'react'
import { NavLink } from 'react-router-dom'

const Sidebar = () => {
    return (
        <>
<div className="app-sidebar sidebar-shadow">
  <div className="app-header__logo">
    <div className="logo-src" />
    <div className="header__pane ml-auto">
      <div>
        <button type="button" className="hamburger close-sidebar-btn hamburger--elastic" data-class="closed-sidebar">
          <span className="hamburger-box">
            <span className="hamburger-inner" />
          </span>
        </button>
      </div>
    </div>
  </div>
  <div className="app-header__mobile-menu">
    <div>
      <button type="button" className="hamburger hamburger--elastic mobile-toggle-nav">
        <span className="hamburger-box">
          <span className="hamburger-inner" />
        </span>
      </button>
    </div>
  </div>
  <div className="app-header__menu">
    <span>
      <button type="button" className="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
        <span className="btn-icon-wrapper">
          <i className="fa fa-ellipsis-v fa-w-6" />
        </span>
      </button>
    </span>
  </div>    <div className="scrollbar-sidebar">
    <div className="app-sidebar__inner">
      <ul className="vertical-nav-menu">
        <li className="app-sidebar__heading">Dashboards</li>
          <li>
            <NavLink to={'/admin/dashboard'} activeClassName="mm-active" >
                <i className="metismenu-icon pe-7s-rocket" />
                Dashboard
            </NavLink>
          </li>
        <li className="app-sidebar__heading">User</li>
          <li>
            <NavLink to={'/admin/users'} activeClassName="mm-active" >
                <i className="metismenu-icon pe-7s-display2" />
                Users
            </NavLink>
          </li>
        <li className="app-sidebar__heading">Posts</li>
        <li>
            <NavLink to={'/admin/posts'} activeClassName="mm-active" >
                <i className="metismenu-icon pe-7s-display2" />
                Posts
            </NavLink>
        </li>
        <li className="app-sidebar__heading">Locations</li>
        <li>
            <NavLink to={'/admin/location'} activeClassName="mm-active" >
                <i className="metismenu-icon pe-7s-display2" />
                Locations
            </NavLink>
        </li>
      </ul>
    </div>
  </div>
</div>
  
        </>
    )
}

export default Sidebar
