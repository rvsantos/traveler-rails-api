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

  context 'when show all categories' do
    before { get '/categories', params: {}, headers: headers }

    let!(:categories) { create_list(:category, 10) }

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end

    it 'returns a list of categories' do
      expect(Category.count).to eq(10)
    end
  end

  context 'when update category' do
    let!(:category) { create(:category) }
    let!(:category_id) { category.id }

    before do
      patch "/categories/#{category_id}", params: params.to_json,
                                          headers: headers
    end

    context 'when params are valid' do
      let(:params) { attributes_for(:category, name: 'Padaria') }

      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end

      it 'returns a new name' do
        expect(json[:name]).to eq(params[:name])
      end
    end

    context 'when params are not valid' do
      let(:params) { attributes_for(:category, name: '') }

      it 'returns status code 422' do
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'returns json with key errors' do
        expect(json).to have_key(:errors)
      end
    end

    context 'when the category not found' do
      let(:category_id) { 1000 }
      let(:params) { attributes_for(:category, name: 'Padaria') }

      it 'returns status code 404' do
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
