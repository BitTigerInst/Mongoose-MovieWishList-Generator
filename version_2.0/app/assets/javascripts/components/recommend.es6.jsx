var Recommend = React.createClass({
  getInitialState(){
    return {
      movies: this.props.movies,
      favs: {},
      user_id: this.props.user_id,
      wishes: {}
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

  // _updateWishes(movie) {
  //   var wishes = this.state.wishes;
  //   if (movie.id in wishes) {
  //     delete wishes[movie.id];
  //   } else {
  //     wishes[movie.id] = movie;
  //   }

  //   this.setState({
  //     wishes: wishes
  //   });
  // },


  _lucy(){
    var page = Math.floor(Math.random() * 25) + 1
     // var user_id = this.props.user_id
    $.get("/apis/get_wish?page="+page, function(data) {
      this.setState({
        movies: data
      });
    }.bind(this));
  },
  _discover(){
    var page = Math.floor(Math.random() * 100) + 1
     // var user_id = this.props.user_id
    $.get("/apis/discover?page="+page, function(data) {
      this.setState({
        movies: data
      });
    }.bind(this));
  },

  _onSubmitFav(){
    var user_id = this.props.user_id
    $.ajax({
      type:"POST",
      url:'/users/wishes',
      data: {favs:this.state.favs},
      dataType: "json",
      success: function(){
        console.log(user_id);
        location.href = "/users/wish/"+user_id;

      }
    });
  },

  render() {
    return(
      <div className="col-sm-12">
        <h1>Make Your Movie Wish List</h1>
        <div className='col-sm-8'>
          <button className='btn btn-danger navbar-left' onClick={this._lucy}>I am Feeling Lucky</button>
          <button className='btn btn-primary navbar-right' onClick={this._discover}>Discover More</button>
        </div>
         <button className="btn btn-success col-sm-offset-2" onClick={this._onSubmitFav}> Set Your List</button>
        <List
          movies={this.state.movies}
          updateFavs={this._updateFavs}
          // updateWishes={this._updateWishes}
          favs={this.state.favs}
          // wishes={this.state.wishes}
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
  //  _pickWishes(movie) {
  //   this.props.updateWishes(movie);
  // },

  render(){
    return (
      <div className='col-sm-8'>
        {this.props.movies.map(function(movie, idx) {
          return (
            <Movie
              key={'movie'+idx}
              movie={movie}
              isFav={movie.id in this.props.favs}
              // isWish={movie.id in this.props.Wishes}
              onClick={this._onClick}
              // onPickWishes={this._pickWishes}
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
   // _pickWishes(e){
   //   this.props.onPickWishes(this.props.movie);
   // },

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
          width="80%"
          onClick={this._onClick}
        />

      </div>
    );
  }
});

// var UserWishList = React.createClass({
//   _onClick(movie) {
//     this.props.updateWishes(movie);
//   },

//   render(){
//     var wishes = Object.keys(this.props.wishes).map(function(id) {
//       var movie = this.props.wishes[id];
//       return (
//         <UserWishMovie
//           key={'movie'+id}
//           movie={movie}
//           onClick={this._onClick}
//         />
//       );
//     }.bind(this));

//     return (
//       <div className="col-sm-4">
//         {wishes}
//       </div>
//     );
//   }
// })

// var UserWishMovie = React.createClass({
//   _onClick(e) {
//     this.props.onClick(this.props.movie);
//   },

//   render(){
//     return(
//      <div className="col-sm-6" >
//       <p></p>
//         <img
//           src={'http://image.tmdb.org/t/p/w500'+this.props.movie.poster_path}
//           width="150"
//           onClick={this._onClick}
//         />

//       </div>
//     );
//   }
// });
