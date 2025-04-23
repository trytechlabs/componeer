require 'rails_helper'

RSpec.describe 'Home::Index - Root path' do
  describe 'GET /' do
    subject(:get_root) { get root_path }

    context 'when user is not logged in' do
      before { get_root }

      it { expect(response).to have_http_status(:ok) }
    end

    context 'when user is logged in' do
      before do
        get_root
      end

      it { expect(response).to have_http_status(:ok) }
      it { expect(response.body).to include('Another tailwind-based component set for Rails') }
    end
  end
end
