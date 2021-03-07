describe 'Categories API', type: :request do
  let!(:category) { build(:category) }
  let(:headers) { valid_headers }

  # before { host! 'api.traveler.test' }

  context 'when creating a new category' do
    before do
      post '/categories', params: params.to_json, headers: headers
    end

    context 'with a valid params' do
      let(:params) { attributes_for(:category) }

      it 'returns status code 201' do
        expect(response).to have_http_status(:created)
      end

      it 'returns category name' do
        expect(json[:name]).to eq(params[:name])
      end
    end

    context 'without a valid params' do
      let(:params) { attributes_for(:category, name: '') }

      it 'returns status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns key error' do
        expect(json).to have_key(:errors)
      end
    end
  end
end