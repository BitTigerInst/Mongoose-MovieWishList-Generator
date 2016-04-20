var Setup = React.createClass({
  getInitialState(){
    return {
      movies: this.props.movies,
      page: 1,
      favs: {}
    };
  },

  _updateFavs(movie) {
    var favs = this.state.favs;
    if (movie.id in favs) {
      delete favs[movie.id];
    } else {
      favs[movie.id] = movie;
    }

    this.setState({
      favs: favs
    });
  },

  _prev(){
    var page = this.state.page;
    if (page > 1) {
      page -= 1;
    }
    $.get("/apis/get_movie?page="+page, function(data) {
      this.setState({
        page: page,
        movies: data
      });
    }.bind(this));
  },

  _next(){
    var page = this.state.page;
    if (page < 227) {
      page += 1;
    }
    $.get("/apis/get_movie?page="+page, function(data) {
      this.setState({
        page: page,
        movies: data
      });
    }.bind(this));
  },

  _onSubmit(){
    var user_id = this.props.user_id
    $.ajax({
      type:"POST",
      url:'/users/carts',
      data: {favs:this.state.favs},
      dataType: "json",
      success: function(){
        console.log(user_id);
        location.href = "/users/"+user_id;

      }
    });
  },

  render() {
    return(
      <div className="col-sm-12">
        <h1>Please pick your favorite movies</h1>
        <div className='col-sm-8'>
           <button className='btn btn-secondary btn-primary navbar-left' onClick={this._prev}>Previouse Page</button>
            <button className='btn btn-secondary btn-primary navbar-right' onClick={this._next}>Next Page</button>

        </div>

         <button className="btn btn-success col-sm-offset-2" onClick={this._onSubmit}> Set Your List</button>
        <List
          movies={this.state.movies}
          updateFavs={this._updateFavs}
          favs={this.state.favs}
        />
         <UserList
          updateFavs={this._updateFavs}
          favs={this.state.favs}
          authenticity_token={this.props.authenticity_token}
          onUserListSubmit={ this.handleSubmit }
        />
      </div>
    );
  }
});

var List = React.createClass({
  _onClick(movie) {
    this.props.updateFavs(movie);
  },

  render(){
    return (
      <div className='col-sm-8'>
        {this.props.movies.map(function(movie, idx) {
          return (
            <Movie
              key={'movie'+idx}
              movie={movie}
              isFav={movie.id in this.props.favs}
              onClick={this._onClick}
            />
          );
        }.bind(this))}
      </div>
    );
  }
});

var Movie = React.createClass({

  _onClick(e) {
    this.props.onClick(this.props.movie);
  },

  render(){
    var imgStyle = {
      margin: "5",
      opacity: this.props.isFav ? 0.4 : 1.0
    };
    return(
      <div className="col-sm-6" >
        <img
          src={'http://image.tmdb.org/t/p/w500'+this.props.movie.poster_path}
          style={imgStyle}
          width="300"
          onClick={this._onClick}
        />
      </div>
    );
  }
});

var UserList = React.createClass({
  _onClick(movie) {
    this.props.updateFavs(movie);
  },

  render(){
    var favs = Object.keys(this.props.favs).map(function(id) {
      var movie = this.props.favs[id];
      return (
        <UserMovie
          key={'movie'+id}
          movie={movie}
          onClick={this._onClick}
        />
      );
    }.bind(this));

    return (
      <div className="col-sm-4">
        {favs}
      </div>
    );
  }
})

var UserMovie = React.createClass({

  _onClick(e) {
    this.props.onClick(this.props.movie);
  },

  render(){
    return(
     <div className="col-sm-6" >
      <p></p>
        <img
          src={'http://image.tmdb.org/t/p/w500'+this.props.movie.poster_path}
          width="300"
          onClick={this._onClick}
        />

      </div>
    );
  }
});
