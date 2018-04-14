import React from 'react';
import ReactDOM from 'react-dom';

class Header extends React.Component {
  constructor(props) {
    super(props);

    this.handleTogglerClick = this.handleTogglerClick.bind(this);

    this.state = {
      menuOpen: false,
    };
  };

  handleTogglerClick() {
    this.setState(() => ({menuOpen: !this.state.menuOpen}));
  }

  render() {
    return (
      <header>
        <div className={this.state.menuOpen ? 'menu is-open' : 'menu'} >
          <button className="menu__toggler" onClick={this.handleTogglerClick}>
            <i className="menu__icon material-icons">menu</i>
            <span className="menu__text">Menu</span>
          </button>
        </div>

        <nav className={this.state.menuOpen ? 'nav is-open' : 'nav'}>
          <div className="menu menu--limited menu--with-bg">
            <button className="menu__toggler" onClick={this.handleTogglerClick}>
              <i className="menu__icon material-icons">close</i>
              <span className="menu__text">Menu</span>
            </button>
          </div>

          <ul className="nav__list">
            <li className="nav__item"><a className="nav__link">Dashboard</a></li>
            <li className="nav__item"><a className="nav__link">My Logs</a></li>
            <li className="nav__item"><a className="nav__link">My Documents</a></li>
          </ul>
        </nav>
      </header>
    );
  }
};

ReactDOM.render(<Header />, document.getElementById('header'));
