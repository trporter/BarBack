//= require_tree ./components
var SearchBar = React.createClass ({

  getInitialState: function () {
    return{ searchString: '' };
  },

  handleChange: function (e) {
    this.setState({searchString:e.target.value});
  },

  render: function () {
    var cocktails = this.props.items,
        searchString = this.state.searchString.trim().toLowerCase();

    if (searchString.length > 0) {
      cocktails = { <%= @cocktails.to_json %> }.filter(function(1){
        return 1.name.toLowerCase().match( searchString );
      });
    }

    return (
      <div>
        <input type="text" value={this.state.searchString} onChange={this.handleChange} placeholder="Hey Bartender" />
      </div>
    );
  }
});

ReactDOM.render(<SearchBar items={ <%= @cocktails.to_json %> } />,
document.getElementById('container'));
